require 'spec_helper'

describe CostType do
  
  it 'should not be destroyed if there are costs' do
      cost = Factory(:cost)
      lambda do
        cost.cost_type.destroy
      end.should change(CostType, :count).by(0)
  end
  
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

