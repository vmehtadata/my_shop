require 'rails_helper'

feature "Welcome Page" do 
	scenario "When visiting the home page, the user should 'Welcome aboard'" do
	visit '/'
	expect(page).to have_text('Welcome aboard')
	end
end