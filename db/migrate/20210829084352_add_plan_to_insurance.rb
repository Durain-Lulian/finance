class AddPlanToInsurance < ActiveRecord::Migration[6.1]
  def change
    add_column :insurances, :plan, :string
  end
end
