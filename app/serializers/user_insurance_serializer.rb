class UserInsuranceSerializer
    include JSONAPI::Serializer

    attributes :value

    attribute :name do |ui|
        ui.insurance.name
    end

    attribute :benefits do |ui|
        ui.insurance.description
    end

    attribute :tier do |ui|
        if ui.value < 50
            'basic'
        elsif ui.value < 100
            'comprehensive'
        else 
            'premium'
        end
    end
end