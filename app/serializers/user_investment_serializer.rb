class UserInvestmentSerializer
    include JSONAPI::Serializer

    attributes :value

    attribute :name do |ui|
        ui.investment.name
    end

    attribute :benefits do |ui|
        ui.investment.description
    end
end