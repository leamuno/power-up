class RemoveCatergoryColumnFromPowers < ActiveRecord::Migration[7.1]
  def change
    remove_column :powers, :catergory
  end
end
