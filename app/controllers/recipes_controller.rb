class RecipesController < ApplicationController
  before_action :set_recipe, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.includes(:user)
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    if @recipe.destroy
       redirect_to root_path
    else
       redirect_to root_path
    end
  end  


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
