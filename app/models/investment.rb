class Investment < ApplicationRecord
    belongs_to :provider
    has_many :logs, as: :loggable
end
