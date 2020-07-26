class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :event_attendances, source: :attendee

    
    has_many :invitations

    validates :event_name, presence:true
    validates :event_date, presence:true
    validates :location, presence:true

    def self.passed_events(time)
        where("event_date < ?", time)
    end

    def self.upcoming_events(time)
        where("event_date > ?", time)
    end
end
