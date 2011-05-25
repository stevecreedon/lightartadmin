class Filters
  
  @@filters = {}
  
  def initialize(params)
    puts @@filters.inspect
    @@filters.each_key do |comparator|
      @@filters[comparator].each do |attribute|
        #create an array of e.g. @eq = {:cc => 5, :pr => 66}
        get_or_create_comparator_hash(comparator)[attribute] = params[attribute] unless params[attribute].blank?
      end
    end
  
  end
  
  def sql(clazz)
    sql = clazz.to_s.camelize.constantize.new
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
  
  def self.method_missing(mefod, *args)
    if SqlBuilder::COMPARATORS.has_key?(mefod)
      args.each do |arg|
        @@filters[mefod] ||= []
        @@filters[mefod] << arg
      end
      return
    end
    super
  end
  
  private 
  
  def method_to_instance_sym(mefod)
    "@#{mefod.to_s}".to_sym
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
  
  
  
end