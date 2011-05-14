class CreateCostCentres < ActiveRecord::Migration
  def self.up
    create_table :cost_centres do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :cost_centres
  end
end
