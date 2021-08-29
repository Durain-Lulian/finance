class UserController < ApplicationController
    def add 
        user_id = params[:user_id]
        
        user = User.create(id: user_id, total_cashback: 0)
        
        render json: user, status: 200
    end

    def insurance
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        insurance = user.user_insurances.order(:created_at).last

        serializer = UserInsuranceSerializer.new(insurance)

        render json: serializer.serializable_hash, status: 200
    end

    def investment
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        investment = user.user_investments.order(:created_at).last

        serializer = UserInvestmentSerializer.new(investment)

        render json: serializer.serializable_hash, status: 200
    end

    def portfolio
        user_id = params[:user_id]

        user = User.find_by_id(user_id)

        serializer = UserSerializer.new(user)

        render json: serializer.serializable_hash, status: 200
    end
end
    