class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, each_serializer: UserSerializer
        else
            error_messages = []
            error_messages.push("Unauthorized username") unless user
            error_messages.push("Unauthorized password") unless user&.authenticate(params[:password])
            render json: {errors: error_messages}, status: :unauthorized
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
        else 
            render json: {errors: ["Unauthorized user"]}, status: :unauthorized
        end
    end 
end
