class Transaction < ApplicationRecord
    has_many :logs

    def update_logs
        cashback_amount = self.cashback_amount
        user = self.user

        insurance = user.user_insurance
        insurance_value = insurance.value
    end
end
