class Event < ApplicationRecord
    scope :upcoming, -> (n = Date.today.to_s){where("date > ?", n)}
    scope :past, -> (n = Date.today.to_s){where("date < ?", n)}
    has_many :invitations
    has_many :users, through: :invitations
end