class Rental < ApplicationRecord
    validates :date_time, presence: true
    validate :date_time_cannot_be_in_past
    belongs_to :boat
    belongs_to :customer

    def date_time_cannot_be_in_past
        if self.date_time < DateTime.now
            errors.add('Rental date and time cannot be in past')
        end
    end

    def date_time_format
        self.date_time.strftime("%m/%d/%Y at %I:%M%p")
    end

    def customer_name=(customer_name)
        self.customer = Customer.find_or_create_by(name: customer_name)
    end

    def customer_name
        self.customer.name
    end

    def display_date_time
        self.date_time.strftime("%A, %d %b %Y %l:%M %p")
    end

    def self.future_rentals
        self.where('date_time >= ?', DateTime.now )
    end

    # * Build a custom query method that returns only the rentals taking place in the future (after current datetime) and use this on the Boat index page

end
