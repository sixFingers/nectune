class AddSourceIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :source_id, :integer
  end
end
