class AlterAmount < ActiveRecord::Migration
  def self.up
    change_column :costs, :amount, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    ActiveRecord::IrreversibleMigration
  end
end