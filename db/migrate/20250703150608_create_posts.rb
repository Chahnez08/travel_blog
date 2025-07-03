class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :location
      t.string :image_url
      t.datetime :published_at

      t.timestamps
    end
  end
end
