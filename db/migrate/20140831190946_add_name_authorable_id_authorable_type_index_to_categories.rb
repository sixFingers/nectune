class AddNameAuthorableIdAuthorableTypeIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, [:name, :authorable_id, :authorable_type], :unique => true
  end
end
