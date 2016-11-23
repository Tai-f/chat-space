class RemoveGroupIdIdFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :group_id_id, :integer
  end
end
