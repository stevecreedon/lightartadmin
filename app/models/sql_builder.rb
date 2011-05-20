class SqlBuilder
  attr_accessor :snippet, :args
  
  def initialize
    self.snippet = []
    self.args = []
  end
  
  def equals(args)
    apply_args(args, "=")
    self
  end
  
  def greater_than_or_equal(args)
     apply_args(args, ">=")
     self
  end
  
  def to_a
    return [snippet.join(" AND ")] + args
  end
  
  private
  
  def apply_args(args, comparator)
     args.each_key do |key|
        unless args[key].blank?
          self.snippet << "#{key.to_s} #{comparator} ?"
          self.args << args[key]
        end 
      end
  end
  
end