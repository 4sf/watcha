class Post < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  belongs_to :user
  has_many :comments
end
