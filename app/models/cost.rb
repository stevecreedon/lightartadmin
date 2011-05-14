class Cost < ActiveRecord::Base
  
  attr_accessor :vat_inclusive
  
  belongs_to :payment_type
  belongs_to :cost_type
  belongs_to :cost_centre
  belongs_to :company
  belongs_to :contact
  belongs_to :user
  
  validates_presence_of :amount, 
                        :vat, 
                        :description, 
                        :reference, 
                        :payment_date, 
                        :cost_centre, 
                        :user, 
                        :payment_type,
                        :cost_type
  
  validates_presence_of :company, :if => Proc.new{|model| model.contact.nil?}, :message => "can't be blank if contact is blank"
  validates_presence_of :contact, :if => Proc.new{|model| model.company.nil?}, :message => "can't be blank if company is blank"
                        
  before_validation :calculate_vat
  
  
  
  private 
  
  def calculate_vat
    return unless self.vat && self.amount && vat_inclusive
    self.amount = self.amount / ((100.0 + vat.to_f)/100.0) unless vat_inclusive == false || vat_inclusive == 'false'
  end                       
  
end

# == Schema Information
#
# Table name: costs
#
#  id              :integer         not null, primary key
#  amount          :decimal(, )
#  vat             :decimal(, )
#  description     :string(255)
#  reference       :string(255)
#  payment_date    :date
#  cost_centre_id  :integer
#  user_id        :integer
#  payment_type_id :integer
#  cost_type_id    :integer
#  company_id      :integer
#  contact_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

