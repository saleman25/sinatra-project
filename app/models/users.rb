class Users < ActiveRecord::Base 
    has_many :dogs
    has_secure_password
end 