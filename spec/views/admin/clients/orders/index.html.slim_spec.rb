require 'rails_helper'

RSpec.describe "admin/clients/index", type: :view do
  before(:each) do
    assign(:orders, [
      Admin::Clients::Order.create!(),
      Admin::Clients::Order.create!()
    ])
  end

  it "renders a list of admin/clients" do
    render
  end
end
