class UserInsurance < ApplicationRecord
    has_many :logs, as: :loggable
    has_many :receipts, through: :logs
    belongs_to :user
    belongs_to :insurance

    after_validation :update_tier

    def max 
        100
    end

    def next_tier_value
        if self.value < 50
            next_tier_value = 50
        else
            next_tier_value = 100
        end
    end

    def update_tier
        if self.value < 50
            update_attribute(:tier, 1)
        elsif self.value < 100
            update_attribute(:tier, 2)
        else 
            update_attribute(:tier, 3)
        end
    end
end
