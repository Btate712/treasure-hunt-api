class CluesController < ApplicationController

  def index
    clues = Clue.all
    render json: clues
  end

  def show
    clue = Clue.find(params[:id])
    if clue
      render json: clue
    else
      render json: { status: "fail", message: "could not find clue" }
    end
  end

  def create
    # Need to add logic to adjust indeces if clue index is already in use
    clue = Clue.new(clue_params)
    if clue.save
      render json: { status: "success", message: "saved as clue id:#{clue.id}" }
    else
      render json: { status: "fail", message: "could not create clue" }
    end
  end

  def destroy
    if clue = Clue.find(params[:id])
      clue.destroy
      render json: { status: "success", message: "clue destroyed" }
    else
      render json: { status: "fail", message: "could not find clue" }
    end
  end

  private

  def clue_params
    params.permit(
      :text,
      :passcode,
      :location,
      :index,
      :hunt_id,
      :image_id
    )
  end
end
