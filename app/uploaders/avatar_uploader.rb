class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg png]
  end

  version :thumbnail do
    process resize_to_fill: [50, 50]
  end

  version :medium do
    process resize_to_fill: [200, 200]
  end

  def size_range
    1.byte..5.megabytes
  end

  def default_url(*_args)
    "/images/fallback/#{[version_name, 'default_avatar.jpg'].compact.join('_')}"
  end

  def download_avatar_from_url(url)
    self.remote_avatar_url = url
    save
  end
end
