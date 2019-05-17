require 'rails_helper'

RSpec.describe "admin/clients/index", type: :view do
  before(:each) do
    assign(:admin_clients, [
      Admin::Client.create!(),
      Admin::Client.create!()
    ])
  end

  it "renders a list of admin/clients" do
    render
  end
end
