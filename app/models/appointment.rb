class Appointment < ApplicationRecord
    belongs_to :stylist
    belongs_to :client
    belongs_to :service
    belongs_to :concierge
end
