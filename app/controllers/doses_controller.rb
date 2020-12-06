class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  before_action :set_dish, only: [:new, :create]

  def new

    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.dish = @dish
    if @dose.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to dish_path(@dose.dish)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_dish
    @dish = Dish.find(params[:dish_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
