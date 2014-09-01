class AddNameSourceIndexToAuthors < ActiveRecord::Migration
  def change
    add_index :authors, [:name, :source_id], :unique => true
  end
end
