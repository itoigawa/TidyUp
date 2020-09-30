class CreateWearingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :wearing_times do |t|
      t.integer :count, null: false, default: 0
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
