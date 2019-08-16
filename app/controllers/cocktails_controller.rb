class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show

  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      @dose = Dose.new
      @dose.description = params["cocktail"]["doses"]
      @dose.cocktail = @cocktail
      @dose.ingredient = Ingredient.find(params["cocktail"]["ingredient_ids"][1])
      @dose.save
    else
      render 'new'
    end
    redirect_to cocktails_path
  end

  def new
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: 'Cocktail was successfully destroyed.'
  end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :dose_ids, :ingredient_ids)
  end
end
