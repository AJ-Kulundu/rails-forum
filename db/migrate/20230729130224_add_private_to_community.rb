class AddPrivateToCommunity < ActiveRecord::Migration[7.0]
  def change
    add_column :communities, :private, :boolean, default: false
  end
end
