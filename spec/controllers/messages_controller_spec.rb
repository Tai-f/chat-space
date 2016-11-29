require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index, use_route: :messages
      expect(response).to render_template :index
    end

  end
end

