class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  def extension_allowlist
    %w[jpg jpeg png]
  end

  version :full do
    process resize_to_fill: [ 1920, 1080 ]
  end

  version :medium do
    process resize_to_fill: [ 300, 300 ]
  end

  version :thumbnail do
    process resize_to_fill: [ 50, 50 ]
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename
  end

  protected

  def secure_token
    @secure_token ||= SecureRandom.uuid
  end
end
