class Contact < ActiveRecord::Base
  include Optionable
  
  has_many :costs
  
end
