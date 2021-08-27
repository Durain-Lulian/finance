class CreateUserInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_investments do |t|

      t.timestamps
    end
  end
end
