class PicturesController < ApplicationController
  layout 'content'
  
  before_filter :set_workshop
  before_filter :set_picture, only: [:edit, :update, :destroy]
  
  # GET /pictures
  # GET /pictures.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workshop.pictures }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(strong_type params)
    @picture.workshop = @workshop
    raise 'uh, hi?'

    respond_to do |format|
      if @picture.save
        format.html { redirect_to workshop_path, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update_attributes(strong_type params)
        format.html { redirect_to workshop_path, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to workshop_path }
      format.json { head :no_content }
    end
  end
  
  private
  
  def workshop_path
    "/workshops/#{@workshop.year}/"
  end
  
  def set_workshop
    @workshop = Workshop.find_by_year params[:workshop_id]
  end
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
  
end
