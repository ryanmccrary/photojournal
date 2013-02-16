class Entry < ActiveRecord::Base
  attr_accessible :copy, :photo, :image, :user_id, :remote_image_url
  
  belongs_to :user

  mount_uploader :image, ImageUploader

  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # validates :copy, presence: true,
  #					  length: { minimum: 250 }

  # validates :user_id, presence: true

  # validates_attachment_presence :image
  # validates_attachment_size :image, :less_than => 5.megabytes
  # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
