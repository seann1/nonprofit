class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.column :name, :string
    end
  end
end
