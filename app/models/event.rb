# frozen_string_literal: true

class Event < ApplicationRecord
  # scope :upcoming, ->(n = Date.today.to_s) { where('date => ?', n) }
  # scope :past, ->(n = Date.today.to_s) { where('date < ?', n) }
  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }

  has_many :attendances, foreign_key: :event_id
  has_many :attendees, through: :attendances
  has_many :invitations, foreign_key: :event_id
  has_many :invitees, through: :invitations
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  validates :title, presence: true, length: { minimum: 10, maximum: 40 }
  validates :location, presence: true
  # validates :user_id, presence: true
  validates :description, presence: true, length: { minimum: 30, maximum: 250 }
  validates :date, presence: true
end
