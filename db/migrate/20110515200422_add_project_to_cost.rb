class AddProjectToCost < ActiveRecord::Migration
  def self.up
    add_column :costs, :project_id, :integer
  end

  def self.down
    remove_column :costs, :project_id
  end
end