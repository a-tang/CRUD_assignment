require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

let(:product) { FactoryGirl.create(:product)}

  describe "#new" do
    before { get :new}

    it "renders a new template" do
      # This checks the Routes only which is why it always passes
      expect(response).to render_template(:new)
    end
    it "assigns a product object" do
      # This second line checks controllers file
      expect(assigns(:product)).to be_a_new Product
    end
  end



  describe "#create" do
    describe "with valid attributes" do

      def valid_request
        post :create, product: {title: "dlkjfd", body: "34sd", price: 134}
        # FactoryGirl.attributes_for(:product)
      end
      it "saves a record to the database" do
        count_before = Product.count
        valid_request
        count_after = Product.count
        expect(count_after).to eq(count_before + 1)
      end
    #
    #
    #   it "redirects to the products show page"
    #   it "sets a flash message"
    # end
    #
    # describe "with invalid attributes" do
    #   it "renders the new template"
    #   it "sets an alert message"
    #   it "doesnt save a record to the database"
    #
      end
    #

  end

end
