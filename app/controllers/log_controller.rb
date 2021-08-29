class LogController < ApplicationController
    def cashback
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        receipts = Receipt.where(user: user).order(:created_at)
        # logs = Log.where(receipt: receipts).order(:created_at)
        cumulative = cashback_to_cumulative_history(receipts)
        render json: cumulative, status: 200
    end

    def insurance
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        receipts = Receipt.where(user: user)
        logs = Log.where(receipt: receipts, loggable_type: 'UserInsurance').order(:created_at)
        
        cumulative = insurance_to_cumulative_history(logs)
        render json: cumulative, status: 200
    end

    def investment
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        receipts = Receipt.where(user: user)
        logs = Log.where(receipt: receipts, loggable_type: 'UserInvestment').order(:created_at)
        
        cumulative = investment_to_cumulative_history(logs)
        render json: cumulative, status: 200
    end

    def cashback_to_cumulative_history(receipts)
        sum = 0

        receipts.each do |receipt|
            sum += receipt.cashback_amount
            receipt.cashback_amount = sum
        end

        receipts
    end

    def insurance_to_cumulative_history(logs)
        sum = 0
        current_date = logs.first.created_at
        
        logs.each do |log|

            if log.created_at > current_date + 1.minutes
                sum = 0
            end

            sum += log.receipt_amount
            log.receipt_amount = sum
        end
        logs
    end

    def investment_to_cumulative_history(logs)
        sum = 0
        
        logs.each do |log|
            sum += log.receipt_amount
            log.receipt_amount = sum
        end
        logs
    end
end