require 'spec_helper'

describe Company do
 
  it 'should not be destroyed if there are costs' do
      cost = Factory(:cost)
      lambda do
        cost.company.destroy
      end.should change(Company, :count).by(0)
  end
 
end

# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

