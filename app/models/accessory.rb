class Accessory < ActiveRecord::Base
  attr_accessible :image, :model
  has_attached_file :image, :styles => { :content=>"600>", :medium => "190>", :thumb => "60>" }
  has_many :winecooler_accessories
  has_many :winecoolers, :through => :winecooler_accessories
end
