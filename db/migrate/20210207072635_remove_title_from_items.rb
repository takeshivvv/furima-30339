class RemoveTitleFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :title, :text
  end
end
