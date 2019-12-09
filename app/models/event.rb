# frozen_string_literal: true

class Event < ApplicationRecord
  scope :upcoming, -> { where('date >= ?', DateTime.now.to_date) }
  scope :past, -> { where('date < ?', DateTime.now) }

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, foreign_key: :attendee_id

  validates :title, presence: true, length: { minimum: 10, maximum: 40 }
  validates :location, presence: true
  validates :description, presence: true, length: { minimum: 30, maximum: 250 }
  validates :date, presence: true
end
