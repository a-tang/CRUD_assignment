require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  let(:product) { FactoryGirl.create(:product)}
  # let(:user) { FactoryGirl.create(:user)}
  let(:review) { FactoryGirl.create(:review)}

  describe "#create" do
      context "with signed in user" do
        before { request.session[:user_id] = user.id }
        it "renders the new template" do
          get :new, product_id: product.id
          expect(response).to render_template(:new)
        end
      end

    context "without a signed in user" do
      it "redirects to sign up page" do
        post :create, product_id: product.id
        expect(response).to redirect_to sessions_path
      end
    end
  end

  describe "#new" do
    context "without a signed in user" do
      it "redirects to sign up page"
      get :new, product_id: product.id
      expect(response).to redirect_ro new_user_path
    end
  end


end
