class User < ApplicationRecord
	before_save :email_to_downcase

	has_many :event_attendings, :foreign_key => :event_guest_id, dependent: :destroy
	has_many :confirmed_events, :through => :event_attendings, :source => :guest_event
	has_many :hosted_events, :foreign_key => "host_id", :class_name => "Event", dependent: :destroy

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL }
	has_secure_password
	validates :password, presence: true, length: { minimum: 8 }

	private

		def email_to_downcase
			email.downcase!
		end

end