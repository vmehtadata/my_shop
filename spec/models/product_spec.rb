require 'rails_helper'

RSpec.describe Product, type: :model do
	describe "validations" do

		describe "#name" do

			it "must be present" do
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:name]).to include("can't be blank")
			end

			it "must be 100 characters or less" do
				subject.name ="-" * 101
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:name]).to include("is too long (maximum is 100 characters)")
			end

		end

		describe "#description" do

			it "must be present" do
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:description]).to include("can't be blank")
		  end

		  it "requires name to be 2000 characters or less" do
  			subject.description = "-" * 2001 
  			expect(subject.valid?).to eq(false)
				expect(subject.errors[:description]).to include("is too long (maximum is 2000 characters)")	
  		end

		end

		describe "#price" do

			it "must be present" do
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:price]).to include("can't be blank")
			end

			it "must be a number" do
				subject.price="foo"
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:price]).to include("is not a number")
			end

			it "must be greater than zero" do
				subject.price = 0
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:price]).to include("must be greater than 0")
			end
			
			it "must be less than 10,000" do
				subject.price = 10000
				expect(subject.valid?).to eq(false)
				expect(subject.errors[:price]).to include("must be less than 10000")
			end

		end

	end
end
