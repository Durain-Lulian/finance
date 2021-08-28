class UserController < ApplicationController
    def add 
        user_id = params[:user_id]
        
        user = User.create!(id: user_id)
        
        render json: user, status: 200
    end
end
    