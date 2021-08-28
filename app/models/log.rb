class Log < ApplicationRecord
    belongs_to :loggable, polymorphic: true
    belongs_to :transaction
end
