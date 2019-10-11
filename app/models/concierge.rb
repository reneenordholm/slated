class Concierge < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :clients, through: :appointments
    has_many :services, through: :appointments

    has_secure_password

    # validates :username, presence: true, uniqueness: true, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: "cannot contain blank space, numbers, or special characters" }
    # validates :email, presence: true, format: { with: /[^@]+@[^\.]+\..+/, message: "must be in format xxxx@xxxx.xxx"}
    # validates :password, presence: true, length: { in: 6..20 }

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |c|
            c.name = auth.info.first_name
            c.email = auth.info.email
            c.username = auth.info.email
        end
    end

end
