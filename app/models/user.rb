class User < ApplicationRecord
    has_many :insurances, through: :user_insurances
    has_many :investments, through: :user_investments

    has_many :user_insurances
    has_many :user_investments
end
