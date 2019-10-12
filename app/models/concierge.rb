class Concierge < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :clients, through: :appointments
    has_many :services, through: :appointments

    has_secure_password

    validates :email, presence: true, format: { with: /[^@]+@[^\.]+\..+/, message: "must be in format xxxx@xxxx.xxx"}
    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6}

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |c|
          c.name = auth.info.first_name
          c.password = Sysrandom.base64(32)
        end
      end

end

