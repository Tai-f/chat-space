require 'rails_helper'
describe Message do
  describe '#create' do

    it "is valid with a body, email, group_id, user_id" do
      message = create(:message)
      expect(message).to be_valid
    end
  end
end
