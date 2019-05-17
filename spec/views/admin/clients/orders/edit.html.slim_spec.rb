require 'rails_helper'

RSpec.describe "admin/clients/edit", type: :view do
  before(:each) do
    @admin_client = assign(:admin_client, Admin::Clients::Order.create!())
  end

  it "renders the edit admin_client form" do
    render

    assert_select "form[action=?][method=?]", admin_client_path(@admin_client), "post" do
    end
  end
end
