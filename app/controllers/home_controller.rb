class HomeController < ApplicationController
  
  def index
    @filters = CostFilters.new(params)
   # @costs = Cost.where("user_id = ? AND payment_date >= ?", params[:has_spent], Date.from(params[:in_the_last].to_i))
  end
  
end