class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :authorable_id
      t.string :authorable_type

      t.timestamps
    end
  end
end
