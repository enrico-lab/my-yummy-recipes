class IngredientsController < ApplicationController

  # def index
  #   if params[:query].present?
  #     @ingredients = Ingredient.where("ingredient I like ?", "%#{params[:query]}%")
  #   else
  #     @ingredients = Ingredient.all
  #   end
  # end

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    # @items = Item.where(category: @category)
    # @favorite = Favorite.new
    # @items = @category.items
    # @category = Category.where(name: 'plant-based recipes')
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @ingredients = @ingredients.where(sql_query, query: "%#{params[:query]}%")
    end
  end
end
