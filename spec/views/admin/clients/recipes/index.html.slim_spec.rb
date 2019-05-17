require 'rails_helper'

RSpec.describe "admin/clients/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Admin::Clients::Recipe.create!(),
      Admin::Clients::Recipe.create!()
    ])
  end

  it "renders a list of admin/clients" do
    render
  end
end
