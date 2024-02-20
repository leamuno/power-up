class AddCategoryColumnToPowers < ActiveRecord::Migration[7.1]
  def change
    add_column :powers, :category, :string
  end
end
