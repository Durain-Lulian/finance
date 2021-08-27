class Insurance < ApplicationRecord
    belongs_to :provider
    has_many :user_insurances
end
