class AddReferencesToLoggable < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_insurances, :loggable, polymorphic: true, type: :uuid
    add_reference :user_investments, :loggable, polymorphic: true, type: :uuid 
  end
end
