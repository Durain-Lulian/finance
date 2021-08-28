class Transaction < ApplicationRecord
    has_many :logs
    belongs_to :user

    def update_logs
        cashback_amount = self.cashback_amount
        user = self.user

        insurance = user.user_insurances.first
        investment = user.user_investments.first

        insurance_value = insurance.value
        investment_value = investment.value

        # change
        next_tier_value = 50
        if insurance_value < next_tier_value
            # calculate value needed for next tier
            insurance_value_to_upgrade = next_tier_value - insurance_value

            # add the value
            if cashback_amount < insurance_value_to_upgrade
                insurance_value += cashback_amount
                cashback_amount = 0
            else
                cashback_amount -= insurance_value_to_upgrade
                insurance_value += insurance_value_to_upgrade
            end
        end
        
        investment_value += cashback_amount
        
        insurance.update(value: insurance_value)
        investment.update(value: investment_value)
    end
end
