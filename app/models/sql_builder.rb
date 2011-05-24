class SqlBuilder
  attr_accessor :snippet, :args
  
  @@map = {:has_spent => :user_id,
           :in_the_last => :payment_date,
           :cc => :cost_centre_id,
           :pr => :project_id}

  def initialize(sql_params={})
    self.snippet = []
    self.args = []
  end
  
  def eq(args)
    apply_args(args, "=")
    self
  end
  
  def gt_or_eq(args)
     apply_args(args, ">=")
     self
  end
  
  def to_a
    return [snippet.join(" AND ")] + args
  end
 
  def self.map(args)
    @@map.merge(args)
  end
  
  map :in_the_last => :user_id, 
      :cc => :cost_centre_id, 
      :pr => :project_id, 
      :has_spent => :user_id
  
  def apply_args(args, comparator)
     args.each_key do |key|
        raise "unknown key #{key}" unless args.has_key?(key)
        unless args[key].blank?
          self.snippet << "#{@@map[key]} #{comparator} ?"
          self.args << args[key]
        end 
      end
  end
  
end