require 'rails_helper'

RSpec.describe "Admin::Clients", type: :request do
  describe "GET /admin_clients" do
    it "works! (now write some real specs)" do
      get admin_clients_path
      expect(response).to have_http_status(200)
    end
  end
end
