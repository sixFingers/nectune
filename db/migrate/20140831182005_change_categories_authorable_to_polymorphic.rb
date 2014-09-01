class ChangeCategoriesAuthorableToPolymorphic < ActiveRecord::Migration
  def change
    add_index :categories, :authorable_id
  end
end
