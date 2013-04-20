class CreateNoms < ActiveRecord::Migration
  def change
    create_table :noms do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.text :steps
      t.text :ingredients
      t.string :category

      t.timestamps
    end
    add_index :noms, [:user_id, :created_at]
  end
end
