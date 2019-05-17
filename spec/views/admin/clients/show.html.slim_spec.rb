require 'rails_helper'

RSpec.describe "admin/clients/show", type: :view do
  before(:each) do
    @admin_client = assign(:admin_client, Admin::Client.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
