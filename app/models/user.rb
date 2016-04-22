class User < ActiveRecord::Base
  has_secure_password

  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :nullify
  has_many :favourites, dependent: :destroy
  has_many :faved_products, through: :likes, source: :product

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(s\.[a-z]+)*\.[a-z]+\z/i
 validates :email, uniqueness: true, presence: true, format: VALID_EMAIL_REGEX

 def full_name
   name = "#{first_name} #{last_name}"
   name.titleize
 end

 def titleize(string)
   string.split(" "). map {|x| x.capitalize}
 end

end
