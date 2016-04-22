require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
      it "requires a first name" do
        u = User.new FactoryGirl.attributes_for(:user).merge({first_name: nil})
        expect(u).to be_invalid
      end

      it "requies a last name" do
        u = User.new FactoryGirl.attributes_for(:user).merge({last_name: nil})
        expect(u).to be_invalid
      end

      it "requiers an email" do
        u = User.new FactoryGirl.attributes_for(:user).merge({email: nil})
        expect(u).to be_invalid
      end

      it "requires a unique email" do
        u  = FactoryGirl.create(:user)
        # u.save
        u2 = User.new FactoryGirl.attributes_for(:user).merge({email: u.email})
        expect(u2).to be_invalid
      end
    end

      it "full_name method must return titleized first_name and last_name concatenated" do
        u = User.new FactoryGirl.attributes_for(:user).merge({first_name: "tom", last_name: "smith"})
        expect(u.full_name).to eq("Tom Smith")

      end
end
