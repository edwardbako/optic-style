class AddRecipesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :od_sph, :string
    add_column :orders, :od_cyl, :string
    add_column :orders, :od_ax, :string
    add_column :orders, :od_add, :string
    add_column :orders, :os_sph, :string
    add_column :orders, :os_cyl, :string
    add_column :orders, :os_ax, :string
    add_column :orders, :os_add, :string
    add_column :orders, :dp, :string
  end
end
