class SpicesController < ApplicationController
  before_action :find_spice, only: [:update, :destroy]
  def index
    spices = Spice.all
    render json: spices, status: :ok
  end

  def create
    spice = Spice.create!(spice_params)
    render json: spice, status: :created
  end

  def update
    @spice.update(spice_params)
    render json: @spice, status: :ok
  end

  def destroy
    @spice.destroy

    head :no_content
  end

  private

  def find_spice
    @spice = Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

end
