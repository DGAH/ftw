class RecipesController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :destroy]
    
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
    end
    
private
    def recipe_params 
        params.require(:recipe).permit(:name) 
    end

end
