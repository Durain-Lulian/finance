class UserInsurance < ApplicationRecord
    has_many :logs, as: :loggable
    has_many :transactions, through: :logs
    belongs_to :user
    belongs_to :insurance
end
