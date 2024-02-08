require 'rails_helper'

RSpec.describe Room do
  context "scopes" do
    describe "#public_rooms" do
      let!(:private_room) { FactoryBot.create(:room, :private) }
      let!(:public_room) { FactoryBot.create(:room, :public) }

      it "should return public rooms" do
        result = Room.public_rooms

        expect(result).to match_array([public_room])
      end
    end
  end
end
