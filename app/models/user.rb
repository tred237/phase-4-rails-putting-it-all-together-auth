class User < ApplicationRecord
    has_many :recipes
    validates :username, uniqueness: true, presence: true
    has_secure_password
end
