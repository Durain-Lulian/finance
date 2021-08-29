class AddImageToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :image, :string
  end
end
  