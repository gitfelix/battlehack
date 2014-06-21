class TestPicture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
