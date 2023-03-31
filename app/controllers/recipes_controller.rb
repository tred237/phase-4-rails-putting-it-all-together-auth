class RecipesController < ApplicationController
    before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :recipe_invalid_response
    
    def index
        recipes = Recipe.where(user_id: session[:user_id])
        render json: recipes
    end

    def create
        recipe = User.find(session[:user_id]).recipes.create!(recipes_params_permit)
        render json: recipe, status: :created
    end

    private

    def recipes_params_permit
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def recipe_invalid_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authorize
        render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end
end
