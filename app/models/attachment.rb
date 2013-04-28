class Attachment < ActiveRecord::Base
  attr_accessible :name, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  before_create :default_name

  def default_name
  	self.name ||= File.basename(self.image_file_name, '.*').titleize if image
  end
end
