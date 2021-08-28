class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs, id: :uuid do |t|
      t.uuid :loggable_id
      t.string :loggable_type
      t.float :transaction_amount
      t.uuid :transaction_id
      t.timestamps
    end
  end
end
