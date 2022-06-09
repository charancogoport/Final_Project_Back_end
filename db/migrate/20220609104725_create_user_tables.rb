class CreateUserTables < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tables do |t|
        t.string :user_name
        t.string :password
        t.string :email
        t.timestamp :created_at
        t.timestamp :updated_at
        # comulsory things should be added as not null..how?
      # t.timestamps
    end
  end
end
