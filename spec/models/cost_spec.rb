require 'spec_helper'

describe Cost do
  
  describe 'vat calculations' do
   
    it 'should do nothing when vat_inclusive is false' do
      cost = Factory.build(:cost, :amount => 117.5, :vat => 17.5)
      cost.vat_inclusive = false
      cost.valid?
      cost.amount.should == 117.5   
    end
    
    it 'should remove vat when vat_inclusive is true or \'true\'' do
      
      cost = Factory.build(:cost, :amount => 117.5, :vat => 17.5)
      cost.vat_inclusive = true
      cost.valid?
      cost.amount.should == BigDecimal.new('100.0')
      
      cost = Factory.build(:cost, :amount => 117.5, :vat => 17.5)
      cost.vat_inclusive = 'true'
      cost.valid?
      cost.amount.should == BigDecimal.new('100.0')
      
    end
    
  end
  
  describe 'validations' do
        
    it 'should not be valid when the cost is unpopulated' do
      cost = Cost.new
      cost.valid?.should be_false
      cost.errors.size.should == 11
      cost.errors[:description].should == ["can't be blank"]
      cost.errors[:reference].should == ["can't be blank"]
      cost.errors[:payment_date].should == ["can't be blank"]
      cost.errors[:user].should == ["can't be blank"]
      cost.errors[:cost_centre].should == ["can't be blank"]
      cost.errors[:cost_type].should == ["can't be blank"]
      cost.errors[:description].should == ["can't be blank"]
      cost.errors[:amount].should == ["can't be blank"]
      cost.errors[:vat].should == ["can't be blank"]
      cost.errors[:company].should == ["can't be blank if contact is blank"]
      cost.errors[:contact].should == ["can't be blank if company is blank"]
    end
    
    it 'should be valid if there is no company but a contact' do
      cost = Factory.build(:cost, :company => nil)
      cost.valid?.should be_true
    end
    
    it 'should be valid if there is no contact but a company' do
      cost = Factory.build(:cost, :contact => nil)
      cost.valid?.should be_true
    end
    
    it 'should not be valid if there is no company or contact' do
      cost = Factory.build(:cost, :contact => nil, :company => nil)
      cost.valid?.should be_false
    end
   
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
#  payer_id        :integer
#  payment_type_id :integer
#  cost_type_id    :integer
#  company_id      :integer
#  contact_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

