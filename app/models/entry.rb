class Entry < ActiveRecord::Base
  attr_accessible :copy, :photo, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
