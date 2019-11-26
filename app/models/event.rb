class Event < ApplicationRecord
    has_many :invitations, foreign_key: "event_id", class_name: "Invitation"
end
