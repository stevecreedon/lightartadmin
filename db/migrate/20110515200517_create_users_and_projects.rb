class CreateUsersAndProjects < ActiveRecord::Migration
  def self.up
    User.create!(:email => 'steve@light-art.co.uk', :password => 'Fyodor01')
    User.create!(:email => 'myra@light-art.co.uk', :password => 'H3ll3r')
    Project.create!(:name => 'Archie')
    Project.create!(:name => 'Blake')
    Project.create!(:name => 'Baily')
    CostCentre.delete_all
    CostCentre.create!(:name => 'Model Development')
    CostCentre.create!(:name => 'Shop')
    CostCentre.create!(:name => 'Marketing')
    CostCentre.create!(:name => 'Postage & Packing')
  end  
  
  def self.down
    User.delete_all
    Project.delete_all
  end
end
