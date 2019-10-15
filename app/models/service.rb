class Service < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :clients, through: :appointments
    has_many :concierges, through: :appointments

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :duration, presence: true
end
