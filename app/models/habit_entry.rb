class HabitEntry < ActiveRecord::Base
    belongs_to :user
   
    def formatted_created_by
        self.created_at.strftime("%b %d, %Y")
    end

end
