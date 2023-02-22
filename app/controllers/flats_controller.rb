class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def edit
  end

  def update
    # @flat.update(params_flat)
    if @flat.update(params_flat)
      redirect_to @flat, notice: "flat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def params_flat
    params.require(:flat).permit(
      :name, :address, :description,
      :price_per_night, :number_of_beds,
      :number_of_guests, :area
    )
  end
end
