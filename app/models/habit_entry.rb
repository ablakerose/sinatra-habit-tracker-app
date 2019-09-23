class HabitEntry < ActiveRecord::Base
    belongs_to :user
   
    def formatted_created_by
        self.created_at.strftime("%b %d, %Y")
    end

    def sorted_by_date
        self.created_at.strftime("%A, %b %d")
    end

    def sorted_by_day
        self.created_at.strftime("%A")
    end

    def formatted_to_day
        self.created_at.strftime("%A")
    end

    def formatted_to_do_date_to_day
        self.date_to_do_habit.strftime("%A")
    end
    

end
