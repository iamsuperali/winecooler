#coding: utf-8
module ApplicationHelper
  STATUS_LIST = [["可见",1],["屏蔽",0]]
  
  def status_list
    return STATUS_LIST
  end

  def parent_cate_list(category_id)
    return_array = ""
    Category.where("parent_id is null").each do |c|
      return_array += "<option value='#{c.id}'"
      return_array += " selected='selected' " if category_id == c.id
      return_array += ">#{c.name}</option>"
    end

    return return_array.html_safe
  end

  def sub_cate_list(category_id)
    return_array = "<option value=0>--</option>"
    Category.where("parent_id is not null").each do |c|
      return_array += "<option value=#{c.id} class='#{c.parent_id}'"
      return_array += " selected='selected' " if category_id == c.id
      return_array += ">#{c.name}</option>"
    end

    return return_array.html_safe
  end

  def format_status(rule_type)
    (STATUS_LIST .find{|s| s[1] == rule_type})[0]
  end
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
