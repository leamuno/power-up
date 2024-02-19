class CreatePowers < ActiveRecord::Migration[7.1]
  def change
    create_table :powers do |t|
      t.string :name
      t.text :description
      t.string :catergory
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
