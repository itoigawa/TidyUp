class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :category, default: 1
      t.integer :color, default: 1
      t.integer :scene, default: 1
      t.integer :count, default: 0
      t.string :purchased_at
      t.timestamps
    end
  end
end
