require 'spec_helper'

describe CostCentre do
  
  it 'should not be destroyed if there are costs' do
      cost = Factory(:cost)
      lambda do
        cost.cost_centre.destroy
      end.should change(CostCentre, :count).by(0)
  end
  
end

# == Schema Information
#
# Table name: cost_centres
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

