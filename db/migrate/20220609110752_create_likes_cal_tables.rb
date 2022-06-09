class CreateLikesCalTables < ActiveRecord::Migration[7.0]
  def change
    create_table :likes_cal_tables do |t|
      t.integer :user_table_id,foreign_key: true
      t.integer :post_table_id,foreign_key: true
      t.timestamp :created_at
      t.boolean :status
      # t.timestamps
    end
  end
end
