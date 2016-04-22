class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :body, presence: true
  validates :stars, presence: true, inclusion: 1..5

  # validates :stars, numericality: {greater_than_or_equal_to: 0.001}
  # validates :stars, numericality: {less_than_or_equal_to: 5}
  # validates :product_id, presence: true

  def user_full_name
    user ? user.full_name : ""
  end
end
