require 'rails_helper'

RSpec.describe ToDosController, type: :controller do

    let(:to_do) {FactoryGirl.create(:to_do)}

    describe "GET index" do
      it "returns all todos in json format" do
        get :index
        expect(response).to include
          ({ "title": "I have to do this thang",
             "is_completed": true })
      end
    end
end
