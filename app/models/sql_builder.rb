class SqlBuilder
  attr_accessor :snippet, :args
  
  COMPARATORS = {:eq => "=", :gt_or_eq => ">=", :lt_or_eq => "<="}
  
  @@map = {:has_spent => :user_id,
           :in_the_last => :payment_date,
           :cc => :cost_centre_id,
           :pr => :project_id}
  
  def self.map(args)
    @@map.merge(args)
  end
  
  map :in_the_last => :user_id, 
      :cc => :cost_centre_id, 
      :pr => :project_id, 
      :has_spent => :user_id 
  
  

  def initialize(sql_params={})
    self.snippet = []
    self.args = []
  end
  
  def method_missing(mefod, *args)
    if COMPARATORS.has_key?(mefod)
      apply_args(args.first, COMPARATORS[mefod])
      return self
    end
    super
  end
 
  def to_a
    puts "snippet: #{self.snippet.inspect} args: #{self.args.inspect}"
    return [snippet.join(" AND ")] + args
  end
 
  
  
  def apply_args(args, comparator)
     args.each_key do |key|
        raise "unknown key #{key}" unless @@map.has_key?(key)
        unless args[key].blank?
          self.snippet << "#{@@map[key]} #{comparator} ?"
          self.args << args[key]
        end 
      end
  end
  
end