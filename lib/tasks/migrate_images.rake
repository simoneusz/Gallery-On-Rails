namespace :app do
  desc "Parse folder structure to create categories and images"
  task migrate_images: :environment do
    require "fileutils"

    # Создание дефолтного пользователя
    default_user = User.find_or_create_by!(email: "default@example.com") do |user|
      user.username = "default"
      user.password = "password123"
    end

    root_path = Rails.root.join("public", "uploads", "migrate_images")

    unless Dir.exist?(root_path)
      puts "Directory #{root_path} does not exist. Please create it and add folders with images."
      next
    end

    Dir.entries(root_path).each do |folder_name|
      next if folder_name == "." || folder_name == ".."

      category_path = File.join(root_path, folder_name)

      next unless File.directory?(category_path)

      # Создаем категорию
      category = Category.find_or_create_by!(title: folder_name) do |category|
        category.description = folder_name
        category.description = folder_name
        category.user = default_user
      end
      puts "Created/Found Category: #{folder_name}"

      # Добавляем изображения в категорию
      Dir.entries(category_path).each do |file_name|
        next if file_name == "." || file_name == ".."

        image_path = File.join(category_path, file_name)

        # Проверка на файл изображения
        if File.file?(image_path) && file_name =~ /\.(jpg|jpeg|png)\z/i
          # Создаем изображение
          image = Image.new(
            title: File.basename(file_name, ".*"),
            category: category,
            user: default_user,
            image: File.open(image_path)
          )
          if image.save
            puts "Added Image: #{file_name} to Category: #{folder_name}"
          else
            puts "Failed to save Image: #{file_name} - #{image.errors.full_messages.join(", ")}"
          end
        end
      end
    end

    puts "Image migration completed successfully!"
  end
end