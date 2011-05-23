class Contact < ActiveRecord::Base
  include Optionable
  
  validates_presence_of :name
  
  has_many :costs
  
  before_destroy Proc.new{|model| return model.costs.count == 0}
  
end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

