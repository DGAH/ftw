class RecipesController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    
    def create
        @recipe = current_user.recipes.build(recipe_params) 
        if @recipe.save
            flash[:success] = "You have created a recipe!" 
            redirect_to root_url 
        else 
            @feed_items = []
            #render 'static_pages/home' 
            render 'users/show'
        end 
    end
    
    def destroy
        @recipe.destroy 
        flash[:success] = "Recipe deleted" 
        redirect_to request.referrer || root_url 
    end
    
    def details
        @recipe = current_user.recipes.find_by(id: params[:id])
        render 'recipes/details'
    end
    
    def back
        redirect_to root_url
    end
    
private
    def recipe_params 
        params.require(:recipe).permit(:name, :category, :need_ingredients, :steps) 
    end
    
    def correct_user 
        @recipe = current_user.recipes.find_by(id: params[:id]) 
        redirect_to root_url if @recipe.nil? 
    end

end
