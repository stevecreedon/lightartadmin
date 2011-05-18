class Date
  
  ALL = 0
  BEGINNING_OF_WEEK = 1
  SEVEN_DAYS_AGO = 2
  BEGINNING_OF_MONTH = 3
  THIRTY_DAYS_AGO = 4
  
  def self.from(last_id)
     case(last_id)
       when BEGINNING_OF_WEEK
         return beginning_of_week
       when SEVEN_DAYS_AGO
         return Date.today - 7
       when BEGINNING_OF_MONTH
         return beginning_of_month
       when THIRTY_DAYS_AGO
         return Date.today - 30
     end 
   end

   def self.beginning_of_week
     Date.today - Date.today.wday
   end

   def self.beginning_of_month
     Date.today - Date.today.mday
   end
  
end