class Log < ApplicationRecord
    belongs_to :loggable, polymorphic: true
    belongs_to :receipt

    def to_cummulative_history
    end
end
