class CreatePostTable < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tables do |t|
      t.references :user_table,null: false,foreign_key: true
      t.string :title_of_post
      t.string :content
      t.blob :image
      t.timestamp :created_at
      t.timestamp :updated_at
      # t.timestamps
    end
  end
end
