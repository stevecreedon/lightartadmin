class Filters
  attr_accessor :eq_params, :gt_or_eq_params
  @@eq_filters = []
  @@gt_or_eq_filters = []
  
  def initialize(params)
    self.eq_params = {}
    self.gt_or_eq_params = {}
    
    @@eq_filters.each do |attribute|
      self.eq_params[attribute] = params[attribute] unless params[attribute].blank?
    end
    
    @@gt_or_eq_filters.each do |attribute|
      self.gt_or_eq_params[attribute] = params[attribute] unless params[attribute].blank?
    end 
  end
  
  def sql
    sql = ::SqlBuilder.new
    sql.eq(eq_params).gt_or_eq(gt_or_eq_params)
  end
  
  def self.param(*attributes)
    attributes.each do |attribute|
      @@eq_filters << attribute if attribute.is_a?(Symbol) or (attribute.is_a?(Hash) && attribute.values.first == :eq)
      @@gt_or_eq_filters << attribute.keys.first if attribute.is_a?(Hash) && attribute.values.first == :gt_or_eq
    end
  end
  
  def filtered_params
    eq_params.merge(gt_or_eq_params)
  end
  
  def query_string
    filtered_params.collect do |key, value|
      "#{key}=#{value}"
    end.join("&")
  end
  
  param :has_spent, :cc, :pr
  param :in_the_last => :gt_or_eq
  
end