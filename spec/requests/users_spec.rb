require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe " redirecded from GET /profile" do
    it "works! (now write some real specs)" do
      get profile_path
      expect(response).to have_http_status(302)
    end
  end
end
