class PostTable < ApplicationRecord
    validates :title_of_post, presence:true,length: {minimum: 10,maximum: 100}
    validates :content, presence:true,length: {minimum: 50,maximum: 1000}
    # validates :email, presence:true
    belongs_to :user_table
    has_many :likes_table
end
