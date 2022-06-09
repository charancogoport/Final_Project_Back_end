class LikesCalTables < ApplicationRecord
    belongs_to :user_table_id
    belongs_to :post_table_id
end

