class V1::CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    render json: @campaigns, status: :ok
  end
end
