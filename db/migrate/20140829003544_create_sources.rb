class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :feed_url
      t.references :author, index: true

      t.timestamps
    end
  end
end
