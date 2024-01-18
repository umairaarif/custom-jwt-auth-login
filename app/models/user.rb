class User < ApplicationRecord
    require "securerandom"
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true
    
end
