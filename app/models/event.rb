class Event < ApplicationRecord
    scope :upcoming, -> (n = Date.today.to_s){where("date > ?", n)}
    scope :past, -> (n = Date.today.to_s){where("date < ?", n)}
    has_many :invitations
    has_many :users, through: :invitations

    validates :title, presence: true, length: { minimum: 10, maximum: 40}
    validates :location, presence: true
    validates :user_id, presence: true
    validates :description, presence: true, length: { minimum: 30, maximum: 250 }
    validates :date, presence: true
end