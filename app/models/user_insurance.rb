class UserInsurance < ApplicationRecord
    has_many :logs, as: :loggable
    belongs_to :user
    belongs_to :insurance
end
