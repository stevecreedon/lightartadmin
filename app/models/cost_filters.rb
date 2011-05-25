class CostFilters < Filters
  
  eq :has_spent, :cc, :pr
  gt_or_eq :in_the_last
  
end