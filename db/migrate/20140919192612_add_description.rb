class AddDescription < ActiveRecord::Migration
  def change
    add_column :charities, :description, :string
  end
end
