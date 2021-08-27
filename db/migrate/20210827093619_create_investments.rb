class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments, id: :uuid do |t|
      t.string :name
      t.text :description
      t.uuid :provider_id
      t.timestamps
    end
  end
end
