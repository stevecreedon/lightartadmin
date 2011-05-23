class QuickCost < ActiveRecord::Base
  attr_accessor :cost
  validates :name, :presence => true
  validates :json, :presence => true
  
  before_validation :create_json
  
  
  delegate :amount, 
           :vat_inclusive,
           :vat,
           :description,
           :reference,
           :payment_date,
           :project_id,
           :cost_centre_id,
           :cost_type_id,
           :payment_method_id,
           :user_id,
           :contact_id,
           :company_id, :to => :cost, :allow_nil => true
           
  def cost
    @cost ||= self.json.blank? ? Cost.new : Cost.new.from_json(self.json)
  end
    
  private
  
  def create_json
    self.json = self.cost.to_json
  end
    
end

# == Schema Information
#
# Table name: quick_costs
#
#  id         :integer         not null, primary key
#  json       :text
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

