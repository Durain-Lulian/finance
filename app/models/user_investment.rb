class UserInvestment < ApplicationRecord
    has_many :logs, as: :loggable
    has_many :receipts, through: :logs
    belongs_to :user
    belongs_to :investment
end
