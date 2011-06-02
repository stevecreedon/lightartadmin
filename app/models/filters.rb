class Filters
  
  @@filters = {}
  @@title = nil
  
  def initialize(params)
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
      instance_var = comparator_to_instance_attribute_sym(comp)
      filtered_params.merge!(instance_variable_get(instance_var) || {})
    end
    filtered_params
  end
  
  def method_missing(mefod, *args)
      if has_attribute?(mefod)
        return get_attribute_value(mefod)
      end
      super
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
  
  def self.title &block
    @@title = block
  end
  
  def title
    txt = []
    @@title.call self, txt
    txt.join("")
  end
   
  def comparator_to_instance_attribute_sym(mefod)
    "@#{mefod.to_s}".to_sym
  end
   
  def get_or_create_comparator_hash(comparator)
    #e.g. creates @eq = {} or returns the hash @eq if it exists..
    instance_sym = comparator_to_instance_attribute_sym(comparator)
    instance_variable_set(instance_sym , {}) unless get_comparator_hash(comparator)
    return get_comparator_hash(comparator)
  end
  
  def get_comparator_hash(comparator)
    instance_sym = comparator_to_instance_attribute_sym(comparator)
    instance_variable_get(instance_sym)
  end
  
  def get_attribute_value(attribute)
    comparator = get_comparator_for_attribute(attribute)
    comparator_attributes = instance_variable_get comparator_to_instance_attribute_sym(comparator)
    return comparator_attributes[attribute]
  end
  
  def has_attribute?(attribute)
     @@filters.each_key do |comparator|
          return true if @@filters[comparator] && @@filters[comparator].include?(attribute)
     end
     return false
  end
  
  def get_comparator_for_attribute(attribute)
     @@filters.each_key do |comparator|
          return comparator if @@filters[comparator] && @@filters[comparator].include?(attribute)
      end
      raise "unexpected attribute #{attribute}"
  end
  
  
  
end