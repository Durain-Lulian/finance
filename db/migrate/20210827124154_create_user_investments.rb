class CreateUserInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_investments, id: :uuid  do |t|
      t.uuid :user_id
      t.uuid :investment_id
      t.float :value
      t.timestamps
    end

    add_foreign_key :user_investments, :users
    add_foreign_key :user_investments, :investments
  end
end
