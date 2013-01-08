#coding: utf-8
class HomeController < ApplicationController
  before_filter :load_nav_data
  def index
    @slides = Slide.find(:all,:limit=>6)
    @posts = Post.find(:all,:limit=>6)
    @winecoolers = Winecooler.find(:all,:limit=>3)
  end
  
  def search
    q = "%#{params[:keyword]}%"
    @winecoolers = Winecooler.where("model like ?",q).paginate(:page => params[:page], :per_page =>10)
  end
  
  def news
    @posts = Post.find(:all,:limit=>4)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  
  def categories
    @categories = Category.find(:all,:limit=>4)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categories }
    end
    
  end
  
  
end
