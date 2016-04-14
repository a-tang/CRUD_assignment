class Product < ActiveRecord::Base
before_validation :set_default_price

  validates :price, {presence: true}
  validates :title, presence: true, uniqueness: true

  validates :sale_price, presence: true, numericality: {less_than_or_equal_to: :price}

    # after_validation :set_default_price
  def on_sale?
    price > sale_price
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


end
