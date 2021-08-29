class AddColumnToFund < ActiveRecord::Migration[6.1]
  def change
    add_column :investments, :value_per_unit, :float
    add_column :investments, :ticker, :string
  end
end
