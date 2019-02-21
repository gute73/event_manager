class Event < ApplicationRecord
	has_many :event_attendings, :foreign_key => :guest_event_id, dependent: :destroy
	has_many :guests, :through => :event_attendings, :source => :event_guest
	belongs_to :host, :class_name => "User"

	validates :location, presence: true, length: { maximum: 250 }
	validates :date, presence: true
	validate :ensure_date_has_not_passed
	validates :time, presence: true

	private

		def ensure_date_has_not_passed
			if ( date.present? && date < Date.today )
				errors.add(:date, "cannot be before #{Date.today}")
			end
		end

end
