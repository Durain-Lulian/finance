class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts, id: :uuid do |t|
      t.uuid :user_id
      t.float :cashback_amount
      t.timestamps
    end

    add_foreign_key :receipts, :users
    add_foreign_key :logs, :receipts
  end
end
