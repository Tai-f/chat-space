require 'rails_helper'

describe MessagesController do
  let(:user){create(:user)}
  before do
    sign_in user
  end

  after do
    sign_out user
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index, group_id: 5
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "saves the new contact in the database" do
      expect{
        post :create, group_id: 5, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirects to messages#index" do
      post :create, group_id: 5, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path
    end
  end
end

