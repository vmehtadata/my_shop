class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :unconfirmed, -> { where(confirmed_at: nil)}
  scope :expired, -> { unconfirmed.where(arel_table[:created_at].lt(2.weeks.ago)) }

  class << self

  def unconfirmed
  		where(confirmed_at: nil)
  	end

  def expired(expired_at = 2.weeks.ago)
  		where(arel_table[:created_at].lt(expired_at))
  	end
 end

  def send_devise_notification(notification, *args)
  	devise_mailer.send(notification, self, *args).deliver_later
  end
end
