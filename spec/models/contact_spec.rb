require 'spec_helper'

describe Contact do
  
  it 'should not be destroyed if there are costs' do
      cost = Factory(:cost)
      lambda do
        cost.contact.destroy
      end.should change(Contact, :count).by(0)
  end
  
end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

