class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :insurances, :providers
    add_foreign_key :investments, :providers
  end
end
