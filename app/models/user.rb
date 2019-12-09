# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'user_id'
  has_many :attended_events, through: :attendances
  has_many :invitations, foreign_key: 'invitee'
  has_many :invited_events, through: :invitations
  validates :name, presence: true, length: { minimum: 10, maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 150 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def upcoming_events
    attended_events.upcoming
  end

  def past_events
    attended_events.past
  end
end
