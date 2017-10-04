require "rails_helper"

RSpec.describe Admin::NotificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/notifications").to route_to("admin/notifications#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/notifications/new").to route_to("admin/notifications#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/notifications/1").to route_to("admin/notifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/notifications/1/edit").to route_to("admin/notifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/notifications").to route_to("admin/notifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/notifications/1").to route_to("admin/notifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/notifications/1").to route_to("admin/notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/notifications/1").to route_to("admin/notifications#destroy", :id => "1")
    end

  end
end
