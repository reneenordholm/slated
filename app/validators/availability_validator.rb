class AvailabilityValidator < ActiveModel::EachValidator

    # record is the object being validated
    # attribute is either start_time or end_time 
    # value is whatever is currently assigned to start_time and end_time

    # Find all of the appointments for the record 
    # build a list of ranges of unavailable dates (date_ranges is an Array of Arrays). 
    # If the value is included in any of these ranges, we add an error to the 
    # attribute with the indication that the said date is “not available”.
    def validate_each(record, attribute, value)
      appointments = Appointment.where(["stylist_id =?", record.stylist_id])
      date_ranges = appointments.map { |a| a.start_time..a.end_time }
  
        date_ranges.each do |range|
        if range.include?(value) 
            record.errors.add(record.stylist.name, "is already booked during this time.")
        end
      end
    end
end