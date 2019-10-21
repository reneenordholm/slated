class Stylist < ApplicationRecord
    has_many :work_schedules
    has_many :appointments
    has_many :clients, through: :appointments
    has_many :services, through: :appointments
    has_many :concierges, through: :appointments

    validates :name, presence: true, uniqueness: true

    def self.most_booked
        joins(:appointments).group("stylist_id").order("count(stylists.id) DESC").first.name
    end
    
end
