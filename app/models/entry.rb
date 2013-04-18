class Entry < ActiveRecord::Base
  attr_accessible :copy, :photo, :image, :user_id, :remote_image_url, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  
  def crop_image
    image.recreate_versions! if crop_x.present?
  end

  def user_now
    @user_now = User.current_user
  end

  belongs_to :user

  mount_uploader :image, ImageUploader

  default_scope order: 'entries.created_at DESC'

  

  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # validates :copy, presence: true,
  #					  length: { minimum: 250 }

  # validates :user_id, presence: true

  # validates_attachment_presence :image
  # validates_attachment_size :image, :less_than => 5.megabytes
  # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
