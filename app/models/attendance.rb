# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :attendee_id, presence: true
  validates :attended_event_id, presence: true
end
