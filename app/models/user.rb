class User < ApplicationRecord
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    
    has_many :messages, class_name: "Message", foreign_key: "user_id"

    has_secure_password
end
