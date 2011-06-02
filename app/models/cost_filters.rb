class CostFilters < Filters
  
  eq :has_spent, :cc, :pr
  gt_or_eq :in_the_last
  
  title do |filters, title|
    title << "Costs for: "
    title << "#{User.find_by_id(filters.has_spent).email}" if filters.try(:has_spent)
    
  end
  
end