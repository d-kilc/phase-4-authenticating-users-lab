class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def show
        user = User.find session[:user_id]
        render json: user, status: 200
    end
    
    private

    def not_found
        render json: {error: "User not found"}, status: 404
    end
end
