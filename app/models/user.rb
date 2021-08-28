class User < ApplicationRecord
    require 'rufus-scheduler'

    has_many :insurances, through: :user_insurances
    has_many :investments, through: :user_investments

    has_many :user_insurances
    has_many :user_investments
    
    after_create :add_insurance
    after_create :renew_insurance

    def add_insurance
        s = UserInsurance.create(user: self, value: 10, expired: false, insurance: Insurance.first)
        puts s.errors.full_messages
    end

    def renew_insurance
        scheduler = Rufus::Scheduler.new

        scheduler.every '5s' do
            self.user_insurances.order(:created_at).last.update(expired: true)

            UserInsurance.create(user: self, value: 10, expired: false, insurance: Insurance.first)
        end
    end
end
