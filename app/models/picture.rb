class Picture < ActiveRecord::Base
  validates :title, presence: true

  mount_uploader :image, ImagePostUploader

  belongs_to :user
end
