class Category < ActiveRecord::Base
	has_and_belongs_to_many :products

	validates :name, presence: true, length: {maximum: 100}
	validates :description, length: {maximum: 2000}

	before_save if: :name_changed? do
		self.slug = name.parameterize
	end	
end