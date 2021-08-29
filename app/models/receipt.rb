class Receipt < ApplicationRecord
    has_many :logs
    belongs_to :user

    def update_logs
        cashback_amount = self.cashback_amount
        user = self.user

        user.update(total_cashback: user.total_cashback + cashback_amount)

        insurance = user.user_insurances.order(:created_at).last
        investment = user.user_investments.first

        insurance_value = insurance.value
        investment_value = investment.value

        # change
        next_tier_value = insurance.max
        if insurance_value < next_tier_value
            # calculate value needed for next tier
            insurance_value_to_upgrade = next_tier_value - insurance_value

            # add the value
            if cashback_amount < insurance_value_to_upgrade
                insurance_change = cashback_amount 
                insurance_value += insurance_change
                cashback_amount = 0
            else
                insurance_change = insurance_value_to_upgrade
                cashback_amount -= insurance_change 
                insurance_value += insurance_change 
            end
        end
        
        investment_value += cashback_amount
        logs = []
        logs.append(Log.create(loggable: insurance, receipt_amount: insurance_change, receipt: self, reason: 'cashback'))
        logs.append(Log.create(loggable: investment, receipt_amount: cashback_amount, receipt: self, reason: 'cashback'))

        insurance.update(value: insurance_value)
        investment.update(value: investment_value)

        logs
    end
end
