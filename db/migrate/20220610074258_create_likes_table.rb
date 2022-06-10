class CreateLikesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :likes_tables do |t|
      t.references :user_table,null: false,foreign_key: true
      t.references :post_table,null: false,foreign_key: true
      t.timestamp :created_at
      t.boolean :status
      # t.timestamps
    end
  end
end
