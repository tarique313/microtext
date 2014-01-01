class AddUpsAndDownsToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :ups, :integer
    add_column :microposts, :downs, :integer
  end
end
