require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
  	describe "#email" do
  		it "must be unique" do
  			existing_user = FactoryGirl.create :user 
  			new_user = FactoryGirl.build :user

  			expect(new_user.valid?).to eq(false)
  			expect(new_user.errors[:email]).to include("has already been taken")
  		end
  	end
  end
end
