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
