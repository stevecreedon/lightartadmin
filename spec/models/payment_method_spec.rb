require 'spec_helper'

describe PaymentMethod do
  
  it 'should not be destroyed if there are costs' do
      cost = Factory(:cost)
      lambda do
        cost.payment_method.destroy
      end.should change(PaymentMethod, :count).by(0)
  end
  
end

# == Schema Information
#
# Table name: payment_methods
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

