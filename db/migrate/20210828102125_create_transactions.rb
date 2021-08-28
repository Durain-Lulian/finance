class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.uuid :receipt_id
      t.float :cashback_amount
      t.timestamps
    end
  end
end
