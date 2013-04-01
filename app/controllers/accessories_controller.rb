#coding: utf-8
class AccessoriesController < ApplicationController
  load_and_authorize_resource
  layout "admin"
  # GET /accessories
  # GET /accessories.json
  def index
    @accessories = Accessory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accessories }
    end
  end

  # GET /accessories/1
  # GET /accessories/1.json
  def show
    @accessory = Accessory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accessory }
    end
  end

  # GET /accessories/new
  # GET /accessories/new.json
  def new
    @accessory = Accessory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accessory }
    end
  end

  # GET /accessories/1/edit
  def edit
    @accessory = Accessory.find(params[:id])
  end

  # POST /accessories
  # POST /accessories.json
  def create
    @accessory = Accessory.new(params[:accessory])

    respond_to do |format|
      if @accessory.save
        format.html { redirect_to accessories_url, notice: '配件新增成功.' }
        format.json { render json: @accessory, status: :created, location: @accessory }
      else
        format.html { render action: "new" }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accessories/1
  # PUT /accessories/1.json
  def update
    @accessory = Accessory.find(params[:id])

    respond_to do |format|
      if @accessory.update_attributes(params[:accessory])
        format.html { redirect_to accessories_url, notice: '配件修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.json
  def destroy
    @accessory = Accessory.find(params[:id])
    @accessory.destroy

    respond_to do |format|
      format.html { redirect_to accessories_url, notice: '配件删除成功.' }
      format.json { head :no_content }
    end
  end
end
