class Event < ApplicationRecord
	has_many :event_attendings, :foreign_key => :guest_event_id, dependent: :destroy
	has_many :guests, :through => :event_attendings, :source => :event_guest
	belongs_to :host, :class_name => "User"
	default_scope -> { order(date: :desc, time: :desc) }

	validates :title, presence: true, length: { maximum: 30 }
	validates :description, length: { maximum: 250 }
	validates :location, presence: true, length: { maximum: 250 }
	validates :date, presence: true
	validate :ensure_date_has_not_passed
	validates :time, presence: true

	def self.upcoming
		Event.where("date >= ?", Date.current)
	end

	def self.past
		Event.where("date < ?", Date.current)
	end

	def attending?(user)
		guests.include?(user)
	end

	def upcoming?
		date >= Date.current
	end

	private

		def ensure_date_has_not_passed
			if ( date.present? && date < Date.today )
				errors.add(:date, "cannot be before #{Date.today}")
			end
		end

end
