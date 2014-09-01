class ChangeSourceNameToTitle < ActiveRecord::Migration
  def change
    rename_column :sources, :name, :title
  end
end
