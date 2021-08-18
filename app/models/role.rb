require 'pry'

class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |t|
            t.actor
        end
    end

    def locations
        self.auditions.map do |t|
            t.location
        end 
    end

    def lead
        hired_status = self.auditions.find_by(:hired => true)
        if hired_status
            hired_status
        else
            "no actor has been hired for this role"
        end
    end

    def understudy
        second_hired = self.auditions.where(:hired => true).second
        if second_hired
            second_hired
        else
            'no actor has been hired for understudy for this role'
        end

    end
    binding.pry
end