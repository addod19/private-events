class User < ApplicationRecord
    has_many :invitations, foreign_key: "user_id", class_name: "Invitation"


end
