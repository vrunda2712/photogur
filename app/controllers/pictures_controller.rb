
class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: :desc)
    @picture = Picture.new
    @month_old_pictures = Picture.created_before(1.month.ago)
    @most_recent_pictures = Picture.most_recent_five
    @created_in_year_2016 = Picture.created_before(Date.new(2017)).created_after(Date.new(2016))
    @created_in_year_2015 = Picture.created_before(Date.new(2016)).created_after(Date.new(2015))
    @created_in_year_2014 = Picture.created_before(Date.new(2015)).created_after(Date.new(2014))
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
    # { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
    params.require(:picture).permit(:title, :artist, :url)
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
