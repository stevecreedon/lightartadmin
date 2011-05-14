class Company < ActiveRecord::Base
  include Optionable
  
  has_many :costs
  
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

