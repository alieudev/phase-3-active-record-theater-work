class Audition < ActiveRecord::Base
    belongs_to :role

    #Audition.first.role 

    def call_back
        self.update(hired:true)
    end
end