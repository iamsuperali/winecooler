class Slide < ActiveRecord::Base
  attr_accessible :image, :link, :order, :title
  has_attached_file :image, :styles => { :medium => "1300x448>", :thumb => "120x90#" }
end
