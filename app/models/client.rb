class Client < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :services, through: :appointments
    has_many :concierges, through: :appointments
end
