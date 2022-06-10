class LikesCalTables < ApplicationRecord
    belongs_to :user_table
    belongs_to :post_table
end

