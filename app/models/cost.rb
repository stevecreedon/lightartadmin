class Cost < ActiveRecord::Base
  
  default_scope :order => 'created_at payment_date DESC'
  
  HUNDRED = BigDecimal.new('100.00')
  
  attr_accessor :vat_inclusive
  
  belongs_to :payment_method
  belongs_to :cost_type
  belongs_to :cost_centre
  belongs_to :company
  belongs_to :contact
  belongs_to :user
  belongs_to :project
  
  validates :description, :presence => true 
  validates :reference, :presence => true 
  validates :payment_date, :presence => true 
  validates :cost_centre, :presence => true
  validates :user, :presence => true 
  validates :payment_method, :presence => true
  validates :cost_type, :presence => true
  validates :vat_inclusive, :presence => true
  validates :amount, :numericality => true 
  validates :vat, :numericality => true
  
  validates :company, :presence => {:if => Proc.new{|model| model.contact.nil?}, :message => "can't be blank if contact is blank"}
  validates :contact, :presence => {:if => Proc.new{|model| model.company.nil?}, :message => "can't be blank if company is blank"}
                        
  before_validation :calculate_vat
  
  def vat_amount
    total_amount - self.amount
  end
  
  def total_amount
    (self.amount * ((HUNDRED + vat.to_d) / HUNDRED))
  end
  
  private 
  
  def calculate_vat
    return unless self.vat && self.amount && vat_inclusive
    self.amount = self.amount / ((HUNDRED + vat.to_d)/HUNDRED) unless vat_inclusive == false || vat_inclusive == 'false'
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
#  payment_method_id :integer
#  cost_type_id    :integer
#  company_id      :integer
#  contact_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

