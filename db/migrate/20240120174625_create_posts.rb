class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :Title
      t.text :Text
      t.integer :ComentsCounter
      t.string :LikesCounter

      t.timestamps
    end
  end
end
