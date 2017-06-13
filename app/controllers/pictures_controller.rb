
class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @month_old_pictures = Picture.created_before(1.month.ago)
  end

  def show
    @pictures = Picture.find(params[:id])
  end

  def new
    @pictures = Picture.new
  end

  def create
    # render text: "Received POST request to '/pictures' with the data URL: #{params}"
    @pictures = Picture.new(picture_params)
    if @pictures.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def picture_params
    { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
  end

  def edit
    @pictures = Picture.find(params[:id])
  end

  def update
    @pictures = Picture.find(params[:id])
    if @pictures.update_attributes(picture_params)
      redirect_to "/pictures/#{@pictures.id}"
    else
      render :edit
    end
  end

  def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
      redirect_to "/pictures"
  end

end
