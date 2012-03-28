class PhotosController < ApplicationController
  before_filter :find_parent
  before_filter :find_or_build_photo, :except => [:index, :sort]

  def index
    redirect_to @parent
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @photo.save
      respond_to do |format|
        format.html { redirect_to [@parent, @photo], :notice => 'Photo successfully created' }
        format.js
      end
    else
      render :new
    end
  end


  def update
    if @photo.update_attributes(params[:photo])
      redirect_to [@parent, @photo], :notice => 'Photo successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to @parent
  end

  def sort
    # params[:photo] is an array of photo IDs in the order
    # the should be set in the story. Take each ID and it's
    # index in the array, find the photo with the ID and set
    # it's position to the index. Run through the whole ID
    # array. Mongoid will automatically do an atomic update
    # of only the photos whose position has changed.
    params[:photo].each_with_index do |id, idx|
      @parent.photos.find(id).position = idx
    end
    @parent.save
    render :nothing => true
  end

  def persisted?
    false
  end
private


  
  def find_parent
    if !params[:story_id].blank?
      @parent = Story.find(params[:story_id])
    end
    if !params[:product_id].blank?
      @parent = Product.find(params[:product_id])
    end
    if !params[:company_id].blank?
      @parent = Company.find(params[:company_id])
    end
  end

  def find_or_build_photo
    # these have many photos
    if !params[:story_id].blank? or !params[:product_id].blank?
    @photo = params[:id] ? @parent.photos.find(params[:id]) : @parent.photos.build(params[:photo])
      #raise @photo.inspect
    end
    # these have many photos
    if !params[:company_id].blank?
      #raise params.inspect
      @photo = @parent.photo ? @parent.photo : @parent.build_photo(params[:photo])
 
    end
  end
end

