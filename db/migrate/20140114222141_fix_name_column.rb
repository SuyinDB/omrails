class FixNameColumn < ActiveRecord::Migration
  def up
  	rename_column :users, :name, :firstname
  end

  def down
  end
end
