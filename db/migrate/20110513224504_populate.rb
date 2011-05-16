class Populate < ActiveRecord::Migration
  def self.up
    CostCentre.create!(:name => "21st Century Tiger")
    CostCentre.create!(:name => "Light Art R&D")
    CostCentre.create!(:name => "Light Art Business")
    
    PaymentMethod.create!(:name => "Cash")
    PaymentMethod.create!(:name => "Steve, Visa Debit")
    PaymentMethod.create!(:name => "Steve, Amex")
    
    CostType.create!(:name => "stock")
    CostType.create!(:name => "modelling materials")
    CostType.create!(:name => "postage")
    CostType.create!(:name => "packaging")
    CostType.create!(:name => "PPC")
    CostType.create!(:name => "website")
    CostType.create!(:name => "mould manufacture")
    
    
    Company.create!(:name => "SKK")
    Company.create!(:name => "21st Century Tiger")
    Company.create!(:name => "Heico")
  end

  def self.down
    CostCentre.delete_all
    Company.delete_all
    PaymentMethod.delete_all
    CostType.delete_all
  end
end
