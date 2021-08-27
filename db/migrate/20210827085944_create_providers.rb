class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers, id: :uuid do |t|
      enable_extension 'pgcrypto'

      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
