class AddColumnToUsers < ActiveRecord::Migration
  def change

  	add_column :users, :username, :string
  	add_column :users, :mobile, :string
  	add_column :users, :gender, :string
  	
  end
end
