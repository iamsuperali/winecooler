#coding: utf-8
module HomeHelper
  def generate_feature_image(p)
    return_string = ""
    
    if p.thumb_id and Ckeditor::Asset.exists?(p.thumb_id)
      return_string += "<a href='/posts/#{p.id}' title='#{p.title}'>"
      return_string += "<img src='#{Ckeditor::Asset.find(p.thumb_id).url_thumb}' title='#{p.title}' alt='#{p.title}' class='colImgArt imgDetActu' />"
      return_string += "</a>"
    end
    
    return return_string.html_safe
  end
  
end
