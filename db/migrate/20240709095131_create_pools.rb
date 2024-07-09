class CreatePools < ActiveRecord::Migration[7.1]
  def change
    create_table :pools do |t|
      t.string :title
      t.string :address
      t.text :description
      t.float :price
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
