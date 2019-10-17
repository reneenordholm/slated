class Appointment < ApplicationRecord
    belongs_to :stylist
    belongs_to :client
    belongs_to :service
    belongs_to :concierge

    validates :start_time, :end_time, presence: true, availability: true, on: :create
    # validates :start_time, :end_time, presence: true, availability: true, on: :update, if: :should_validate?

    # def should_validate?

    # end

end
