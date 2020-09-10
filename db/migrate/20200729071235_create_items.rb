class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :category, null: false, default: 1
      t.integer :color, null: false, default: 1
      t.integer :scene, null: false, default: 1
      t.integer :count, null:false, default: 0
      t.string :purchased_at, null: false
      t.timestamps
    end
  end
end
