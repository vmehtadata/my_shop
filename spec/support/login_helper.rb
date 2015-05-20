module LoginHelper
	def login_as_user
		FactoryGirl.create :user

		visit '/users/sign_in'
		fill_in 'Email', with: "bob.jones@example.com"
		fill_in 'Password', with: "notasecret"

		click_button "Log in"
	end
end

RSpec.configure do |config|
	config.include(LoginHelper, type: :feature)
end