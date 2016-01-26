require 'rails_helper'

RSpec.describe ToDosController, type: :controller do

    let(:to_do) {FactoryGirl.create(:to_do)}

    describe "GET /todos.json" do
      before do
        get :index
      end
      it "returns all todos in json format" do
        expect(response.content_type).to eq "application/json"
        expect(response).to include
          ({
            "title": "I have to do this thang",
            "is_completed": true
            })
      end
    end

    describe "POST /todos.json" do
      before do
        post :create, to_do: ({title: "New title", is_completed: true})
      end
      it "creates a new post" do
        expect(ToDo.last.title).to eq "New title"
      end
    end
end
