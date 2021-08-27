class AddCreditable < ActiveRecord::Migration[6.1]
  def change
    add_reference :insurances, :creditable, polymorphic: true
    add_reference :investments, :creditable, polymorphic: true
  end
end
