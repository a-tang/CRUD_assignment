require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do

    it "should have a title" do
      p = Product.new
      validation_outcome = p.valid?
      expect(p.errors).to have_key(:title)
    end

    it "should have price" do
      p = Product.new
      validation_outcome = p.valid?
      expect(p.errors).to have_key(:price)

    end
    #
    it "should have a unique title" do
      p0 = Product.new title: "hi!", price: 23, sale_price: 2
      p0.save
      p1 = Product.new title: "hi!", price: 23, sale_price: 2

      p1.valid?

      expect(p1.errors).to have_key :title

    end

    # it "should have a sale price present" do
    #   p3 = Product.new price: 5
    #   validation_outcome = p3.valid?
    #   expect(p3.errors).to have_key(:sale_price)
    #
    # end

    it "should default to price" do
      prod = Product.new price: 5
      validation_outcome = prod.valid?
      expect(prod.sale_price).to eq(5)

    end
    #
    it "should have a price less than or equal to the price" do
      prod = Product.new price: 4, sale_price: 5
      prod.valid?
      expect(prod.errors).to have_key :sale_price
    end
    #
    it "should have a method called on_sale?" do

      prod = Product.new title: "asfd", price: 23, sale_price: 2
      result = prod.on_sale?
      expect(result).to eq(true)

    end
  end





end
