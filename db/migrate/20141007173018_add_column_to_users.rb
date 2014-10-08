class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teamName, :string
  end
end
