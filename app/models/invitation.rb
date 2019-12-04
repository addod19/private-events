# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User', foreign_key: :invited_user_id
  belongs_to :invited_event, class_name: 'Event', foreign_key: :event_id
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end
