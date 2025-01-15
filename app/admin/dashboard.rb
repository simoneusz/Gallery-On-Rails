# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Last 5 created categories' do
          ul do
            Category.order(created_at: :desc).limit(5).map do |category|
              li link_to(category.title, admin_category_path(category))
            end
          end
        end
      end

      column do
        panel 'Last 5 created comments' do
          ul do
            Comment.order(created_at: :desc).limit(5).map do |comment|
              li link_to(comment.content.truncate(30), admin_user_comment_path(comment))
            end
          end
        end
      end

      column do
        panel '10 last uploaded images' do
          ul class: 'image-list' do
            Image.order(created_at: :desc).limit(10).map do |image|
              li class: 'image-item' do
                link_to(image_tag(image.image.thumbnail.url, size: '50x50'), admin_image_path(image),
                        class: 'image-image')
              end
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Last 10 users activity' do
          table_for ActivityLog.order(created_at: :desc).limit(10) do
            column('Пользователь') { |log| link_to log.user.email, admin_user_path(log.user) }
            column('Тип действия', &:action_type)
            column('URL', &:url)
            column('Время') { |log| log.created_at.strftime('%d.%m.%Y %H:%M') }
          end
        end
      end
    end
  end
end
