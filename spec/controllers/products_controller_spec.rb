require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

let(:product) { FactoryGirl.create(:product)}

  describe "#new" do
    it "renders a new template" do
      expect(response).to render_teomplate(:new)
    end
  end

end
