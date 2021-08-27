class Insurance < ApplicationRecord
    belongs_to :users
    has_many :logs, as: :loggable
end
