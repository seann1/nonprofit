class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.column :charity_id, :string
      t.column :amount, :integer
    end
  end
end
