class CostType < ActiveRecord::Base
  include Optionable
  
  has_many :costs
  
end

# == Schema Information
#
# Table name: cost_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

