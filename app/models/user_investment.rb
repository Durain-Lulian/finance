class UserInvestment < ApplicationRecord
    has_many :logs, as: :loggable
    belongs_to :user
    belongs_to :investment
end
