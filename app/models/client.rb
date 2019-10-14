class Client < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :services, through: :appointments
    has_many :concierges, through: :appointments

    
    validates :email, presence: true, uniqueness: true, format: { with: /[^@]+@[^\.]+\..+/, message: "must be in format xxxx@xxxx.xxx"}
    validates :name, presence: true
    validates :phone, presence: true
end
