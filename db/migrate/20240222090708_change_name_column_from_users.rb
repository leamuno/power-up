class ChangeNameColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :first_name, :alias
    rename_column :users, :last_name, :secret_identity

  end
end
