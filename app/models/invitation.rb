class Invitation < ApplicationRecord
    belongs_to :event
    belongs_to :receiver, class_name: "User"

    validates :receiver_id, presence:true
end
