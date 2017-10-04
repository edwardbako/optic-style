require 'rails_helper'

RSpec.describe "admin/notifications/show", type: :view do
  before(:each) do
    @admin_notification = assign(:admin_notification, Admin::Notification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
