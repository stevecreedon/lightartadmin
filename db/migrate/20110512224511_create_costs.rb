class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.decimal :amount
      t.float :vat
      t.string :description
      t.string :reference
      t.date :payment_date
      t.integer :cost_centre_id
      t.integer :user_id
      t.integer :payment_method_id
      t.integer :cost_type_id
      t.integer :company_id
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :costs
  end
end
