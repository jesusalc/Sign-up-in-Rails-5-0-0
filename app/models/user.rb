class User < ApplicationRecord
  # Ensuring email uniqueness by downcasing the email attribute
  before_save { email.downcase! }

  # https://www.railstutorial.org/book/modeling_users
  validates :name,  presence: true, length: { maximum: 50 }

  # See http://www.rubular.com/ for regular expressions
  # Expression	  Meaning
  # /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	full regex
  # /	            start of regex
  # \A	          match start of a string
  # [\w+\-.]+	    at least one word character, plus, hyphen, or dot
  # @	            literal “at sign”
  # [a-z\d\-.]+	  at least one letter, digit, hyphen, or dot
  # \.	          literal dot
  # [a-z]+	      at least one letter
  # \z	          match end of a string
  # /	            end of regex
  # i	            case-insensitive
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # Most of the secure password machinery will be implemented using a single Rails method
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


end