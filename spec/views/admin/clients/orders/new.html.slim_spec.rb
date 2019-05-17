require 'rails_helper'

RSpec.describe "admin/clients/new", type: :view do
  before(:each) do
    assign(:admin_client, Admin::Clients::Order.new())
  end

  it "renders new admin_client form" do
    render

    assert_select "form[action=?][method=?]", admin_clients_orders_path, "post" do
    end
  end
end
