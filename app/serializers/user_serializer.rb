class UserSerializer
    include JSONAPI::Serializer

     attribute :current_month_cashback do |user|
        receipts = Receipt.where(user: user, created_at: Time.now.beginning_of_month..Time.now.end_of_month)

        sum = 0
        receipts.each do |receipt|
            sum += receipt.cashback_amount
        end

        sum
    end

    attribute :insurance_tier do |user|
        insurance = user.user_insurances.order(:created_at).last

        if insurance.value < 50
            'basic'
        elsif insurance.value < 100
            'comprehensive'
        else 
            'premium'
        end
    end

    attribute :amount_to_next_tier do |user|
        insurance = user.user_insurances.order(:created_at).last
        if insurance.value < 50
            50 - insurance.value
        elsif insurance.value < 100
            100 - insurance.value
        else
            0
        end
    end

    attribute :current_insurance do |user|
        insurance = user.user_insurances.order(:created_at).last

        serializer = UserInsuranceSerializer.new(insurance)

        serializer.serializable_hash
    end

    attribute :current_investment do |user|
        investments = user.user_investments.order(:created_at)

        serializer = UserInvestmentSerializer.new(investments)

        serializer.serializable_hash
    end

    attribute :total_assets do |user|
        investments = user.user_investments.order(:created_at)

        sum = 0
        investments.each do |investment|
            sum += investment.value
        end
        sum
    end
end