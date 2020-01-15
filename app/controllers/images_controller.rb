class ImagesController < ApplicationController
  def index
    @images = Image.order(id: :desc)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image_url, :tag_list)
  end
end
