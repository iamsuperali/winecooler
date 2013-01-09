class Winecooler < ActiveRecord::Base
  attr_accessible :category_id, :desc, :model, :feature
  has_many :uploads,:dependent => :destroy
  belongs_to :category
end
