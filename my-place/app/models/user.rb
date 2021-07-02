class User < ApplicationRecord
    PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
/x

    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { :within => 8..16 }, format: {with: PASSWORD_FORMAT}
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, :address, :phone, presence: true


    has_many :albums
    has_many :journals
    has_many :journalsDrafts
    has_many :photos
end
