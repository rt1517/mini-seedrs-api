# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::InvestmentsController, type: :controller do
  describe 'POST #create' do
    let!(:random_campaign) { FactoryBot.create :campaign, investment_multiple: 2 }

    context 'with valid attributes' do
      let!(:valid_params) do
        {
          investment: {
            campaign_id: random_campaign.id,
            amount: random_campaign.investment_multiple * 2 
          },
          format: :json
        }
      end

      it 'creates a new investment' do
        expect do
          post :create, params: valid_params
        end.to change(Investment, :count).by(1)
      end

      it 'updates associated campaigns percentage raised' do
        post :create,params: valid_params
        expect(random_campaign.percentage_raised).not_to eq(random_campaign.reload.percentage_raised)
      end

      it 'responds to application/json with status code 201' do
        post :create,params: valid_params
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(201)
      end
    end


    context 'with invalid attributes' do
      let!(:invalid_params) do
        {
          investment: {
            campaign_id: nil,
            amount: random_campaign.investment_multiple * 2 
          },
          format: :json
        }
      end

      it 'does not create a new investment' do
        expect do
          post :create, params: invalid_params
        end.to change(Investment, :count).by(0)
      end


      context 'when campaign_id is invalid' do
        it 'responds with error message and status code 422' do
          post :create, params: invalid_params
          expect(JSON.parse(response.body)).to eq(["Campaign must exist"])
          expect(response).to have_http_status(422)
        end
      end

      context 'when amount is not a multiple of campaigns investment multiple' do
        let!(:invalid_params) do
          {
            investment: {
              campaign_id: random_campaign.id,
              amount: 3 
            },
            format: :json
          }
        end

        it 'responds with error message and status code 422' do
          post :create, params: invalid_params
          expect(JSON.parse(response.body)).to eq(["Amount must be multiple of campaign investment multiple"])
          expect(response).to have_http_status(422)
        end
      end      
    end

    context 'when transaction for creation of investment and updation of campaign fails' do
      let!(:valid_params) do
        {
          investment: {
            campaign_id: random_campaign.id,
            amount: random_campaign.investment_multiple * 2 
          },
          format: :json
        }
      end

      before do
        allow_any_instance_of(Campaign).to receive(:update_percentage_raised).and_raise(StandardError.new)
      end

      it 'does not create a new investment' do
        
        expect do
          post :create, params: valid_params
        end.to change(Investment, :count).by(0)
      end

      it 'responds with status code 503 and error message' do
        post :create, params: valid_params
        expect(JSON.parse(response.body)).to eq("error" => "could not create investment, please try again",)
        expect(response).to have_http_status(503)
      end
    end
  end
end
