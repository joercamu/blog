class AddCoverToArticles < ActiveRecord::Migration
   def up
    add_attachment :articles, :cover
  end

  def down
    remove_attachment :articles, :cover
  end
end
