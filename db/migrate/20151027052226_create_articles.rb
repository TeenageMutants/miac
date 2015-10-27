class CreateArticles < ActiveRecord::Migration
	def change
		create_table :articles do |t|
			t.string :title
    	t.integer :types
      t.text :preview
    	t.text :body
    	t.timestamp :published_at
    	t.timestamp :published_to
      t.string :vid_url
      t.string :tag
    	t.belongs_to :user, index: true, null: false
			t.string :name
			t.timestamps null: false
	end
	end
end
