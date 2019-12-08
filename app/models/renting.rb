class Renting < ApplicationRecord

    attr_reader :number_of_days
    
    validates :begin_date, date: true
    validates :end_date, date: { after_or_equal_to: :begin_date }
    validates :client_name, presence: true, length: { maximum: 50 }
    validates_with AvailabilityValidator

    def number_of_days=(value)
        if value.nil?
            @number_of_days = 0
        else
            @number_of_days = value.to_i
        end
    end

    before_validation if: :number_of_days do
        if begin_date.present?
            self.end_date = begin_date.advance(days: (number_of_days > 0) ? number_of_days - 1 : 0)
        end
    end

    def self.availability(begin_date:, number_of_days:)
        return true if begin_date.nil? or number_of_days.nil?
        end_date = begin_date.advance(days: (number_of_days > 0) ? number_of_days - 1 : 0)
        renting_days = (begin_date..end_date)

        (Renting.where(begin_date: begin_date..end_date)
        .or(Renting.where(end_date: begin_date..end_date))).none?
    end

end
