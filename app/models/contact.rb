class Contact < ActiveRecord::Base
  include Optionable
  
  has_many :costs
  
  before_destroy Proc.new{|model| return model.costs.count == 0}
  
end
