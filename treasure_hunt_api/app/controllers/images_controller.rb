class ImagesController < ApplicationController

  def index
    images = Image.all
    render json: images
  end

  def show
    image = Image.find(params[:id])
    if image
      render json: image
    else
      render json: { status: "fail", message: "could not find image" }
    end
  end

  def create
    image = Image.new(image_params)
    if image.save
      render json: { status: "success", message: "saved as image id:#{image.id}" }
    else
      render json: { status: "fail", message: "could not create image" }
    end
  end

  def destroy
    if image = Image.find(params[:id])
      image.destroy
      render json: { status: "success", message: "image destroyed" }
    else
      render json: { status: "fail", message: "could not find image" }
    end
  end

  private

  def image_params
    params.permit(
      :url,
      :alt_text,
    )
  end
end
