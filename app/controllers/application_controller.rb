#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_nav_data

  def home

  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/my/users/sign_in", :alert => "您没有权限进行此操作。"
  end
  
  protected

  Warden::Manager.after_authentication do |user, auth, opts|
    LoginLog.create(:user_id => user.id,:ip=>user.current_sign_in_ip)
  end
  
  def load_nav_data
    @categories = Category.find(:all)
  end
  
  def after_sign_in_path_for(resource)
    "/posts"
  end
  
  
  #
  #    def ckeditor_filebrowser_scope(options = {})
  #      super({ :assetable_id => current_user.id, :assetable_type => 'User' }.merge(options))
  #    end
  #
  #    # Cancan example
  ##    def ckeditor_authenticate
  ##      authorize! action_name, @asset
  ##    end
  #
  #    # Set current_user as assetable
  #    def ckeditor_before_create_asset(asset)
  #      asset.assetable = current_user
  #      return true
  #    end
end
