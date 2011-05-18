class Company < ActiveRecord::Base
  include Optionable
  
  has_many :costs

  before_destroy Proc.new{|model| return model.costs.count == 0}

end

# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

