class User < ApplicationRecord
    has_many :invitations, foreign_key: :user_id
    has_many :events, through: :invitations

    validates :name, presence: true, length: { minimum: 10, maximum: 40 }
    validates :email, presence: true, uniqueness: true
end
