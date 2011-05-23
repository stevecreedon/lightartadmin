class CreateQuickCosts < ActiveRecord::Migration
  def self.up
    create_table :quick_costs do |t|
      t.text :json
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :quick_costs
  end
end
