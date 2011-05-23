class Project < ActiveRecord::Base
  has_many :costs
  validates_presence_of :name
  
  
  
  def first
    self.name
  end
  
  def last
    self.id
  end
  
end

# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

