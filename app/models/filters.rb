class Filters
  
  @@filters = {}
  
  def initialize(params)
    
    @@filters.each_key do |comparator|
      @@filters[comparator].each do |attribute|
        #create an array of e.g. @eq = {:cc => 5, :pr => 66}
        get_or_create_comparator_hash(comparator)[attribute] = params[attribute] unless params[attribute].blank?
      end
    end
  
  end
  
  def sql
    sql = ::SqlBuilder.new
    ::SqlBuilder::COMPARATORS.each_key do |comparator|
      params = get_comparator_hash(comparator)
      sql.send(comparator, params) if params
    end
    sql
  end
  
  def filtered_params
    filtered_params = {}
    ::SqlBuilder::COMPARATORS.each_key do |comp|
      instance_var = method_to_instance_sym(comp)
      filtered_params.merge!(instance_variable_get(instance_var) || {})
    end
    filtered_params
  end
  
  protected
  
  def self.param(*attributes)
    attributes.each do |attribute|
      comp = param_comparator(attribute)
      @@filters[comp] ||= []
      @@filters[comp] << param_name(attribute)
    end
  end
  
  private 
  
  def method_to_instance_sym(mefod)
    "@#{mefod.to_s}".to_sym
  end
  
  def self.param_comparator(arg)
    return :eq if arg.is_a?(Symbol)
    return arg.values.first if arg.is_a?(Hash)
  end
  
  def self.param_name(arg)
    return arg if arg.is_a?(Symbol)
    return arg.keys.first if arg.is_a?(Hash)
  end
  
  def get_or_create_comparator_hash(comparator)
    #e.g. creates @eq = {} or returns the hash @eq if it exists..
    instance_sym = method_to_instance_sym(comparator)
    instance_variable_set(instance_sym , {}) unless get_comparator_hash(comparator)
    return get_comparator_hash(comparator)
  end
  
  def get_comparator_hash(comparator)
    instance_sym = method_to_instance_sym(comparator)
    instance_variable_get(instance_sym)
  end
  
  param :has_spent, :cc, :pr
  param :in_the_last => :gt_or_eq
  param :doh => :lt_or_eq
  
end