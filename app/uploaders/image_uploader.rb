# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.image_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  end


  # process convert: 'png'

  version :big do
    process resize_to_fit: [1024, 1024]
  end

  version :big_square do
    process resize_to_fill: [1024, 1024]
  end

  version :mid, from_verion: :big do
    process resize_to_fit: [640, 640]
  end

  version :mid_square, from_version: :big_square do
    process resize_to_fill: [640, 640]
  end

  version :small, from_version: :mid do
    process resize_to_fit: [240, 240]
  end

  version :small_square, from_version: :mid_square do
    process resize_to_fill: [240, 240]
  end

  version :thumbnails, from_version: :small do
    process resize_to_fit: [75, 75]
  end

  version :thumb_square, from_version: :small_square do
    process resize_to_fill: [75, 75]
  end



  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  def content_type_whitelist
    /image\//
  end

  def filename
    if original_filename
      if model && model.read_attribute(mounted_as).present?
        model.read_attribute(mounted_as)
      else
        "#{SecureRandom.uuid}.#{file.extension}"
      end
    end
  end

end
