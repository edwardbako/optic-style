require 'rails_helper'

RSpec.describe "admin/notifications/index", type: :view do
  before(:each) do
    assign(:@notifications, [
      Admin::Notification.create!(),
      Admin::Notification.create!()
    ])
  end

  it "renders a list of admin/notifications" do
    render
  end
end
