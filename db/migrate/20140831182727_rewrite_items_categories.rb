class RewriteItemsCategories < ActiveRecord::Migration
  def up
    rename_table :items_categories_tables, :categories_items

    add_column :categories_items, :item_id, :integer
    add_index :categories_items, :item_id

    add_column :categories_items, :category_id, :integer
    add_index :categories_items, :category_id
  end

  def down
    rename_table :categories_items, :items_categories_tables
  end
end
