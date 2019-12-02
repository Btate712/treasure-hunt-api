class HuntsController < ApplicationController

  def index
    hunts = Hunt.all
    render json: hunts
  end

  def show
    hunt = Hunt.find(params[:id])
    if hunt
      render json: hunt
    else
      render json: { status: "fail", message: "could not find hunt" }
    end
  end

  def create
    hunt = Hunt.new(hunt_params)
    if hunt.save
      render json: { status: "success", message: "saved as hunt id:#{hunt.id}" }
    else
      render json: { status: "fail", message: "could not create hunt" }
    end
  end

  def update
    hunt = Hunt.find(params[:id])
    hunt.update(hunt_params)
    if hunt.save
      render json: { status: "success", message: "updated hunt with id:#{hunt.id}" }
    else
      render json: { status: "fail", message: "could not update hunt" }
    end
  end

  def destroy
    if hunt = Hunt.find(params[:id])
      hunt.destroy
      render json: { status: "success", message: "hunt destroyed" }
    else
      render json: { status: "fail", message: "could not find hunt" }
    end
  end

  private

  def hunt_params
    params.permit(
      :title,
      :password,
    )
  end
end
