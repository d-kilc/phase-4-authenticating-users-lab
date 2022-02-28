class SessionsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def create
        user = User.find_by! username: params[:username]
        session[:user_id] ||= user.id
        render json: user, status: 200
    end

    def destroy
        # puts session
        session.delete :user_id
        head :no_content
    end

    private

    def not_found
        render json: {error: "User not found."}, status: 404
    end
end
