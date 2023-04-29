# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::CampaignsController, type: :controller do
  describe 'GET #index' do
    before do
      FactoryBot.create_list(:campaign, 10, name: "Ronalds #{Faker::Company.name}")
      FactoryBot.create_list(:campaign, 5)
    end

    context 'when filtering params are not set' do
      it 'returns all the campaigns' do
        get :index
        expect(JSON.parse(response.body).count).to eq(15)
        expect(response).to have_http_status(200)
      end
    end

    context 'when filtering with column' do
      it 'returns the correct collection for correct query' do
        get :index, params: { filter_by: "name", query: "Ronalds" }
        expect(JSON(response.body).count).to eq(10)
      end

      it 'return empty when no match' do
        get :index, params: { filter_by: "name", query: "123" }
        expect(JSON(response.body).count).to eq(0)
      end
    end

    context 'when filtering column is invalid' do
      it 'returns correct error message with status' do
        get :index, params: { filter_by: "invalid", query: "123" }
        expect(JSON(response.body)).to eq("error" => "filter_by only allows id,name,image_url,country,sector,percentage_raised,target_amount,investment_multiple")
        expect(response).to have_http_status(422)
      end
    end
  end
end
