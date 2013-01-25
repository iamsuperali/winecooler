#coding: utf-8
class Category < ActiveRecord::Base
  has_many :winecoolers
  attr_accessible :name, :order, :parent_id, :status,:bg,:desc
  has_attached_file :bg, :styles => { :content => "941x207>", :thumb => "120x90#" }
end
