class UserController < ApplicationController
    def add_user
        user_id = params[:user_id]
        
        render json: { user_id: user_id }, status: 200
    end
end
    