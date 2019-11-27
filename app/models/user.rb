class User < ApplicationRecord
    has_many :invitations, foreign_key: :creator_id
    has_many :events, through: :invitations
end
