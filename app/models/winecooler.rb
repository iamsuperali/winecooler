class Winecooler < ActiveRecord::Base
  attr_accessible :category_id, :desc, :model, :feature
  has_many :uploads,:dependent => :destroy
  belongs_to :category
  acts_as_list :scope => :category
  default_scope order('position')
end
