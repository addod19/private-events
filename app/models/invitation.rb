class Invitation < ApplicationRecord
    belongs_to :users, class_name: "User"
    belongs_to :events, class_name: "Event" 
end
