#coding: utf-8
class WinecoolersController < ApplicationController
  load_and_authorize_resource
  layout "admin"
  # GET /winecoolers
  # GET /winecoolers.json
  def index
    unless params[:category] && params[:category][:id] && !params[:category][:id].blank?
      @winecoolers = Winecooler.paginate(:page => params[:page], :per_page =>10)
    else
      @category = Category.find(params[:category][:id])
      @winecoolers = @category.winecoolers.paginate(:page => params[:page], :per_page =>10) if @category
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @winecoolers }
    end
  end

  # GET /winecoolers/1
  # GET /winecoolers/1.json
  def show
    @winecooler = Winecooler.find(params[:id])
    @uploads = @winecooler.uploads
    
    respond_to do |format|
      format.html { render :layout=>"application"}# show.html.erb
      format.json { render json: @winecooler }
      format.xml {
        xml_string = "<icons>"
        xml_string +="<icon image=\"/images/skins/commun/bgTitreProduit.png\" action=\"javascript:lanceZoomNoir(1);\" target=\"_self\" titre=\"\" desc=\"\" />"
        xml_string += "</icons>"
        render :text=>xml_string
      }
    end
  end

  # GET /winecoolers/new
  # GET /winecoolers/new.json
  def new
    @winecooler = Winecooler.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @winecooler }
    end
  end

  # GET /winecoolers/1/edit
  def edit
    @winecooler = Winecooler.find(params[:id])
  end

  # POST /winecoolers
  # POST /winecoolers.json
  def create
    @winecooler = Winecooler.new(params[:winecooler])

    respond_to do |format|
      if @winecooler.save
        Upload.update_all({:winecooler_id=>@winecooler.id},["winecooler_id is null"])
        format.html { redirect_to winecoolers_url, notice: '红酒柜创建成功.' }
        format.json { render json: @winecooler, status: :created, location: @winecooler }
      else
        Upload.delete_all(["winecooler_id is null"])
        format.html { render action: "new" }
        format.json { render json: @winecooler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /winecoolers/1
  # PUT /winecoolers/1.json
  def update
    @winecooler = Winecooler.find(params[:id])

    respond_to do |format|
      if @winecooler.update_attributes(params[:winecooler])
        Upload.update_all({:winecooler_id=>@winecooler.id},["winecooler_id is null"])
        format.html { redirect_to winecoolers_url, notice: '红酒柜修改成功.' }
        format.json { head :no_content }
      else
        Upload.delete_all(["winecooler_id is null"])
        format.html { render action: "edit" }
        format.json { render json: @winecooler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winecoolers/1
  # DELETE /winecoolers/1.json
  def destroy
    @winecooler = Winecooler.find(params[:id])
    @winecooler.destroy

    respond_to do |format|
      format.html { redirect_to winecoolers_url }
      format.json { head :no_content }
    end
  end
  
  def sort
    @category = Category.find(params[:category_id])
    @category.winecoolers.each do | w |
      w.position = params["item"].index(w.id.to_s)+1
      w.save
    end
    render :nothing => true
  end
  
  def sequence
    if params[:category] && !params[:category][:id].blank?
      @category = Category.find(params[:category][:id])
    end
  end
  
  def accessory
    @winecooler = Winecooler.find(params[:id])
    @accessories = Accessory.all
  end
  
  def update_accessories
    @winecooler = Winecooler.find(params[:id])
    
    if params[:winecooler]
      @winecooler.accessories.clear
      params[:winecooler][:accessories].each do |a|
        cur_accessory =  Accessory.find(a)
        @winecooler.accessories << cur_accessory if cur_accessory
      end
    end
    
    respond_to do |format|
      if @winecooler.save
        format.html { redirect_to winecoolers_url, notice: '选择配件成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "accessory" }
        format.json { render json: @winecooler.errors, status: :unprocessable_entity }
      end
    end
  end
end
