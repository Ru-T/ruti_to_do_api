require 'rails_helper'

RSpec.describe ToDosController, type: :controller do

    let(:to_do) { FactoryGirl.create(:to_do) }
    let(:json) { JSON.parse(response.body) }

    describe "GET /to_dos.json" do
      before do
        get :index
      end
      it "returns all to_dos in json format" do
        expect(json).to include
          ({
            "title": "I have to do this thang",
            "is_completed": true
            })
      end
    end

    describe "POST /to_dos.json" do
      before do
        request = post :create, to_do: { title: "New title", is_completed: true }
      end
      it "creates a new to_do" do
        expect(ToDo.last.title).to eq "New title"
        expect(json["to_do"]["title"]).to eq "New title"
        expect(json["to_do"]["is_completed"]).to eq true
        expect { request }.to change{ ToDo.count }.by(1)
      end
    end

    describe "PUT /to_dos/:id.json" do
      before do
        put :update, id: to_do.id, to_do: { title: "Brand new title", is_completed: false }
      end
      it "updates a new to_do" do
        expect(json["to_do"]["title"]).to eq "Brand new title"
        expect(json["to_do"]["is_completed"]).to eq false
      end
    end

    describe "DELETE /to_dos/:id.json" do
      before do
        delete :destroy, id: to_do.id
      end
      it "deletes a to_do" do
        expect(ToDo.find_by_id(to_do.id)).to be_nil
      end
    end
end
