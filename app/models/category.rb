#coding: utf-8
class Category < ActiveRecord::Base
  scope :parent, where( :parent_id => nil )
  has_many :winecoolers
  has_many :subcategories, :class_name => "Category",
    :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Category"
  attr_accessible :name, :order, :parent_id, :status,:bg,:desc
  has_attached_file :bg, :styles => { :content => "941x207>", :thumb => "120x90#" }
end
