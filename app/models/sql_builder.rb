class SqlBuilder
  attr_accessor :snippet, :args
  
  def initialize
    self.snippet = []
    self.args = []
  end
  
  def equals(args)
    args.each_key do |key|
      unless args[key].blank?
        self.snippet << "#{key.to_s} = ?"
        self.args << args[key]
      end 
    end
  end
  
  def greater_than_or_equal(args)
    args.each_key do |key|
      unless args[key].blank?
        self.snippet << "#{key.to_s} >= ?"
        self.args << args[key]
      end 
    end
  end
  
  def to_a
    return [snippet.join(" AND ")] + args
  end
  
end