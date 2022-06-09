class CreateUserProfileTables < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profile_tables do |t|
        t.integer :user_table_id,foreign_key: true
        t.string :user_description
        t.string :first_name
        t.string :last_name
        t.blob :profile_picture
        t.timestamp :created_at
        t.timestamp :updated_at
      # t.timestamps
    end
  end
end
