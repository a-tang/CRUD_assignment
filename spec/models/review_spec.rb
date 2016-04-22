require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it "star count is required" do
      r = Review.new(body: "This product is great!", stars: 3)
      expect(r).to be_valid
    end

    it "must be a number between 1 and 5 inclusive" do
      r = Review.new(body: "This product is great!", stars: 1)
      expect(r).to be_valid
    end
  end
end
