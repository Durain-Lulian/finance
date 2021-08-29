class ReceiptController < ApplicationController
    def add
        receipt_id = params[:receipt_id]
        cashback_amount = params[:cashback_amount].to_f
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        receipt = Receipt.create(id: receipt_id, cashback_amount: cashback_amount, user: user)
        logs = receipt.update_logs

        render json: { investment: user.user_investments.first, insurance: user.user_insurances.first, logs: logs }
    end
end