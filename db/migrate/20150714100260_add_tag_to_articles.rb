class AddTagToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tag, :integer
  end
end
