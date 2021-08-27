class CreateUserInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :user_insurances, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :insurance_id
      t.timestamps
    end

    add_foreign_key :user_insurances, :users
    add_foreign_key :user_insurances, :insurances
  end
end
