class AddPositionIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :position_id, :integer
  end
end
