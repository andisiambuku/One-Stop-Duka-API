class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, confirmation: true, presence: true, length: {in: 6..20, messsage: "Password must be between 6 and 20 characters."}
    validates :password_confirmation, presence: true
end
