class UserTable < ApplicationRecord
    has_many :post_table
    has_many :user_post_table
    has_many :likes_table
    validates :user_name, presence:true,length: {minimum: 6,maximum: 100},:uniqueness => true
    validates :password, presence:true,length: {minimum: 8,maximum: 30}
    validates :email, presence:true,:uniqueness => true

end



