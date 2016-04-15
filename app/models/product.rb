class Product < ActiveRecord::Base
has_many :reviews, dependent: :destroy
belongs_to :category
belongs_to :user
before_validation :set_default_price

  validates :price, {presence: true}
  validates :title, presence: true, uniqueness: true

  validates :sale_price, presence: true, numericality: {less_than_or_equal_to: :price}

    # after_validation :set_default_price
  def on_sale?
    price > sale_price
  end

  def user_full_name
    user ? user.full_name : ""
  end

  private

  def set_default_price
  #   if sale_price.nil?
  #     sale_price = price
  #   else
  #     sale_price
  #   end
    self.sale_price ||= price
  end

  def titleize_title
  self.title = title.titleize
  end


end
