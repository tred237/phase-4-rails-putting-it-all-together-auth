class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :user_not_found_response
    
    def create
        user = User.create(user_params_permit)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(session[:user_id])
        render json: user, status: :created
    end

    private

    def user_params_permit
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    def user_not_found_response(invalid)
        render json: {error: "Not authorized"}, status: :unauthorized
    end
end
