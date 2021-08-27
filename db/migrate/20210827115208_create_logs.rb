class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs, id: :uuid do |t|
      t.uuid :loggable_id
      t.string :loggable_type
      t.timestamps
    end
  end
end
