class PaymentType < ActiveRecord::Base
  include Optionable
  
  belongs_to :user
  has_many :costs
  
  validates_presence_of :name
  
end

# == Schema Information
#
# Table name: payment_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

