class User < ApplicationRecord
  PASSWORD_FORMAT = /\A
(?=.{8,})          # Must contain 8 or more characters
(?=.*\d)           # Must contain a digit
(?=.*[a-z])        # Must contain a lower case character
(?=.*[A-Z])        # Must contain an upper case character
/x

  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false } 
  validates :password, presence: true, length: { :within => 8..16 }, format: {with: PASSWORD_FORMAT}, on: :create
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, :address, :phone, presence: true
  validates :password,  presence: true, on: :update, allow_blank: true
  validates :username, :name, :image, :address, :post_code, :email, :phone, presence: true, on: :update, allow_blank: true

  has_one_attached :img
  has_many :albums
  has_many :journals
  has_many :journalsDrafts
  has_many :photos
  has_many :musics
  has_many :notes
end
