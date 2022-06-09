class UserTable < ApplicationRecord
    validates :user_name, presence:true,length: {minimum: 6,maximum: 100}
    validates :password, presence:true,length: {minimum: 8,maximum: 30}
    validates :email, presence:true
end

