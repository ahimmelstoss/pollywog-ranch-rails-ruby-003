class AddFlyCountToFrogs < ActiveRecord::Migration
  def change
    add_column :frogs, :fly_count, :integer, :default => 0, :null => false
  end
end
