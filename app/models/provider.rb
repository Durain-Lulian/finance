class Provider < ApplicationRecord
    has_many :insurances
    has_many :investments
end
