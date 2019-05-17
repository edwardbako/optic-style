require 'rails_helper'

RSpec.describe "Admin::Clients::Recipes", type: :request do
  describe "GET /admin_clients_recipes" do
    it "works! (now write some real specs)" do
      get admin_clients_recipes_path
      expect(response).to have_http_status(200)
    end
  end
end
