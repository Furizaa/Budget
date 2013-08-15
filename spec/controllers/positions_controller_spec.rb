require 'spec_helper'

describe PositionsController do

    let! (:position) {
        FactoryGirl.create(:position)
        FactoryGirl.create(:position, title: 'Sambal Olek', amount: 1.79)
    }

    context 'index' do 

        let (:get_xhr) do
            xhr :get, :index
            ::JSON.parse(response.body)
        end

        it 'responds with 200' do
            get_xhr
            response.code.should eq "200"
        end

        it 'responds with a list of positions' do
            get_xhr.length.should eq 2
        end

    end

    context 'show' do 
        let (:get_xhr) do
            xhr :get, :show, id: 2
            ::JSON.parse(response.body)
        end

        it 'responds with a single position' do
            get_xhr['title'].should eq 'Sambal Olek'
        end
    end

    context 'create' do
        it 'responds with 200' do
            xhr :post, :create, title: 'Milk', amount: 0.82
            response.code.should eq "200"
        end

        it 'creates the record' do
            xhr :post, :create, title: 'Bread', amount: 0.77
            Position.where(title: 'Bread').length.should eq 1
        end
    end

    context 'update' do
        it 'updates a record' do
            xhr :post, :update, id: 2, title: 'Sambal', amount: 0.1
            response.code.should eq '200'

            position = Position.find 2
            position.title.should eq 'Sambal'
            position.amount.should eq 0.1
        end
    end

    context 'destroy' do
        it 'removes a record' do
            xhr :delete, :destroy, id: 2
            response.code.should eq '200'

            expect { Position.find(2) }.to raise_error
        end
    end

    
end