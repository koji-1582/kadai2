class Post < ActiveRecord::Base
  validates :content, :image, presence: true

  belongs_to :user
  mount_uploader :image, ImageUploader
end
