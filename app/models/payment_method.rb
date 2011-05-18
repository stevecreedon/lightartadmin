class PaymentMethod < ActiveRecord::Base
  include Optionable
  
  belongs_to :user
  has_many :costs
  
  validates_presence_of :name
  
  before_destroy Proc.new{|model| return model.costs.count == 0}
  
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

