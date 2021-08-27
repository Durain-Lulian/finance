class AddReferencesToLoggable < ActiveRecord::Migration[6.1]
  def change
    add_reference :insurances, :loggable, polymorphic: true, type: :uuid
    add_reference :investments, :loggable, polymorphic: true, type: :uuid 
  end
end
