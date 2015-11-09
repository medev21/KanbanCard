class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :listTitle
      t.references :board, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
