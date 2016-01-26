require 'rails_helper'

RSpec.describe ToDosController, type: :controller do

    let(:to_do) {FactoryGirl.create(:to_do)}

    describe "GET /to_dos.json" do
      before do
        get :index
      end
      it "returns all to_dos in json format" do
        expect(response.content_type).to eq "application/json"
        expect(response).to include
          ({
            "title": "I have to do this thang",
            "is_completed": true
            })
      end
    end

    describe "POST /to_dos.json" do
      before do
        post :create, to_do: ({ title: "New title", is_completed: true })
      end
      it "creates a new to_do" do
        expect(ToDo.last.title).to eq "New title"
        expect(response).to include
          ({
            "title": "New title",
            "is_completed": true
            })
      end
    end

    describe "PUT /to_dos/:id.json" do
      before do
        put :update, id: to_do.id, to_do: { title: "Brand new title", is_completed: false }
      end
      it "updates a new to_do" do
        expect(ToDo.where(id: to_do.id)).to include
          ({
            "title": "Brand new title",
            "is_completed": false
            })
      end
    end

    describe "DELETE /to_dos/:id.json" do
      before do
        delete :destroy, id: to_do.id
      end
      it "deletes a to_do" do
        expect(ToDo.where(id: to_do.id)).to be_empty
      end
    end
end
