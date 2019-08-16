class DosesController < ApplicationController
  before_action :set_doses, only: [:show]

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:ingredient_id])
    if @dose.save
      redirect_to cocktail.path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def new
  end

private

  def set_doses
    @doses = Doses.find(params[:id])
  end

  def dose_params
    params.require(:doses).permit(:cocktail_id, :ingredient_id, :description)
  end
end
