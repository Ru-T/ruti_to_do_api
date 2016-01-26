require 'rails_helper'

RSpec.describe ToDo, type: :model do

    let(:to_do) {FactoryGirl.create(:to_do)}

    describe "#as_json" do
      it "returns all fields other than timestamps" do
        expect(to_do.as_json).to include ({ title: "I have to do this thang" })
        expect(to_do.as_json).to include ({ is_completed: true })
      end
    end
end
