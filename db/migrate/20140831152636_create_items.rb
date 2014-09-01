class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.integer :author_id
      t.text :content
      t.text :summary
      t.string :image
      t.datetime :published
      t.datetime :updated
      t.integer :entry_id

      t.timestamps
    end
  end
end
