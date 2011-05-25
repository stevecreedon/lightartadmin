class SqlBuilder
  attr_accessor :snippet, :args
  
  COMPARATORS = {:eq => "=", :gt_or_eq => ">=", :lt_or_eq => "<="}
  
  @@map_to_cols = {}
  
  def self.map(args)
    @@map_to_cols.merge!(args)
  end
  
  def initialize
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
    return [snippet.join(" AND ")] + args
  end
 
  def apply_args(args, comparator)
     args.each_key do |key|
        raise "unknown key #{key}" unless @@map_to_cols.has_key?(key)
        unless args[key].blank?
          self.snippet << "#{@@map_to_cols[key]} #{comparator} ?"
          self.args << args[key]
        end 
      end
  end
  
end