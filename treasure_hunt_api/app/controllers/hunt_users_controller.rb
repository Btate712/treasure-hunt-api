class HuntUsersController < ApplicationController

  def index
    hunt_users = HuntUser.all
    render json: hunt_users
  end

  def show
    hunt_user = HuntUser.find(params[:id])
    if hunt_user
      render json: hunt_user
    else
      render json: { status: "fail", message: "could not find hunt_user" }
    end
  end

  def create
    # Need to add logic to adjust indeces if hunt_user index is already in use
    hunt_user = HuntUser.new(hunt_user_params)
    if hunt_user.save
      render json: { status: "success", message: "saved as hunt_user id:#{hunt_user.id}" }
    else
      render json: { status: "fail", message: "could not create hunt_user" }
    end
  end

  def update
    hunt_user = HuntUser.find(params[:id])
    hunt_user.update(hunt_user_params)
    if hunt_user.save
      render json: { status: "success", message: "updated hunt_user with id:#{hunt_user.id}" }
    else
      render json: { status: "fail", message: "could not update hunt_user" }
    end
  end

  def destroy
    if hunt_user = HuntUser.find(params[:id])
      hunt_user.destroy
      render json: { status: "success", message: "hunt_user destroyed" }
    else
      render json: { status: "fail", message: "could not find hunt_user" }
    end
  end

  private

  def hunt_user_params
    params.permit(
      :hunt_id,
      :user_id,
      :user_type
    )
  end
end
