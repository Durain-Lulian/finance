class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|

      t.timestamps
    end
  end
end
