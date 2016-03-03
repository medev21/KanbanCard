class RemoveBoardIdFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :board_id
  end
end
