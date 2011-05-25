class CostSqlBuilder < SqlBuilder
  
  map :in_the_last => :payment_date, 
      :cc => :cost_centre_id, 
      :pr => :project_id, 
      :has_spent => :user_id
  
end