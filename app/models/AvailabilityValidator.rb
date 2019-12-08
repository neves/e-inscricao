class AvailabilityValidator < ActiveModel::Validator
    
    def validate(record)
        if not Renting.availability(begin_date: record.begin_date, number_of_days: record.number_of_days)
            record.errors[:base] << 'Período não disponível'
        end
    end

end