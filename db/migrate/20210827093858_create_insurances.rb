class CreateInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :insurances, id: :uuid  do |t|
      t.string :name
      t.text :description
      t.uuid :provider_id
      t.integer :tier
      t.timestamps
    end
  end
end
