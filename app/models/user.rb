class User < ActiveRecord::Base 
    has_many :dogs
    has_secure_password
    validates :username, :password, presence: true
    validates_uniqueness_of :username
end 