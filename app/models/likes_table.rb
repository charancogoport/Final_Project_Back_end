class LikesTable < ApplicationRecord
    belongs_to :user_table
    belongs_to :post_table
    # validates :user_table_id,:uniqueness => true
end

