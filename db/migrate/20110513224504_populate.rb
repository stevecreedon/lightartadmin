class Populate < ActiveRecord::Migration
  def self.up
    CostCentre.create!("")
  end

  def self.down
  end
end
