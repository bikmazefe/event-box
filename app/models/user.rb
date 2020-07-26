class User < ApplicationRecord
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"

    has_many :event_attendances, foreign_key: :attendee_id, dependent: :destroy
    has_many :attended_events, through: :event_attendances, dependent: :destroy


    has_many :received_invitations, foreign_key: :receiver_id, class_name: "Invitation"
    has_many :senders, through: :received_invitations

    validates :username, uniqueness: true, presence: true
end
