class AddFeedUrlIndexToSources < ActiveRecord::Migration
  def change
    add_index :sources, :feed_url, unique: true
  end
end
