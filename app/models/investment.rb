class Investment < ApplicationRecord
    belongs_to :provider
    has_many :user_investments
end
