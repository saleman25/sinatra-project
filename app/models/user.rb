class User < ActiveRecord::Base 
    has_many :dogs
    has_secure_password
    validates :username, :password, :name, presence: true
    validates_uniqueness_of :username
end 