class AddDefaultValueToPrivate < ActiveRecord::Migration
  def up
    change_column :wikis, :private, :boolean, :default => false
  end

  def down
    change_column :wikis, :private, :boolean, :default => nil
  end
end
