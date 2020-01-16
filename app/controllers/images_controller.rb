class ImagesController < ApplicationController
  def index
    @images = if search_params[:tag_filter].present?
                Image.tagged_with(search_params[:tag_filter]).order(id: :desc)
              else
                Image.order(id: :desc)
              end
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

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.nil? || @image.destroy
    redirect_to images_path
  end

  def image_params
    params.require(:image).permit(:image_url, :tag_list)
  end

  def search_params
    params.permit(:tag_filter) || nil
  end
end
