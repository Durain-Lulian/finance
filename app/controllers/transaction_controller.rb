class TransactionController < ApplicationController
    def add_transactions
        receipt_id = params[:receipt_id]
        cashback_amount = params[:cashback_amount].to_f
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        transaction = Transaction.create(receipt_id: receipt_id, cashback_amount: cashback_amount, user: user)
    end
end