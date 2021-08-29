class LogController < ApplicationController
    def cashback
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        receipts = Receipt.where(user: user).order(:created_at)
        # logs = Log.where(receipt: receipts).order(:created_at)
        cumulative = to_cumulative_history(receipts)
        render json: cumulative, status: 200
    end


    def to_cumulative_history(receipts)
        sum = 0

        receipts.each do |receipt|
            sum += receipt.cashback_amount
            receipt.cashback_amount = sum
        end

        receipts
    end
end