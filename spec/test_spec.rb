require_relative '../api/controller/pet_controller'
require_relative '../spec/spec_helper'

describe "Pet Store Automated Test", :all do

    let(:body) {attributes_for(:attr_petstore)}
    let(:put) {attributes_for(:attr_petstore_update_status)}
    let(:post_formdata) {attributes_for(:attr_petstore_formdata)}
    let(:id) {body[:id]}

    before(:all) do
        @petStore = PetStore.new
    end

    context "CRUD Pet Store", :CRUD do

        it 'Posting Pet' do
            response = @petStore.postPet(body)
            expect(response.code).to eq(200)
            expect(response["id"]).to eq(id)
        end

        it 'Getting Pet' do
            get_response = @petStore.getPet(id)
            expect(get_response.code).to eq(200)
            expect(get_response["id"]).to eq(id)
        end

        it 'Getting Pets by Status' do
            response = @petStore.getPetByStatus
            expect(response.code).to eq(200)
            expect(response.first["id"]).to be_an(Integer)
        end

        it 'Updating Pet' do
            put_response = @petStore.putPet(put)
            expect(put_response.code).to eq(200)
            expect(put_response["status"]).to eq("pending")
        end


        it 'Updating Pet with form data' do
            formdata_post_response = @petStore.postPetFormData(id, post_formdata)
            get_response = @petStore.getPet(id)
            expect(formdata_post_response["code"]).to eq(200)
            expect(formdata_post_response["message"]).to eq("#{id}")
            expect(get_response["status"]).to eq("sold")
        end


        it 'Delete Pet' do
            delete_response = @petStore.deletePet(id)
            expect(delete_response.code).to eq(200)
            expect(delete_response["code"]).to eq(200)
            expect(delete_response["message"]).to eq("#{id}")
        end

    end


end