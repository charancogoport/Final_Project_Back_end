class UserProfileTable < ApplicationRecord
    belongs_to :user_table
    
    # validates :gender, :in => %w(Male Female)
end

