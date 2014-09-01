class EnlargeContentAndSummaryInItems < ActiveRecord::Migration
  def change
    change_column :items, :summary, :text, :limit => 4294967295
    change_column :items, :content, :text, :limit => 4294967295
  end
end
