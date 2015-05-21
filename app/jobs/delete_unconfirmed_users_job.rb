class DeleteUnconfirmedUsersJob < ActiveJob::Base
	def perform
		User:unconfirmed.expired.destroy_all
	end
end