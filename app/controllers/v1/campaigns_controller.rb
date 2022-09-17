class V1::CampaignsController < ApplicationController
  def index
    if permited_params[:filter_by]
      @campaigns = Campaign.search_by_column(permited_params[:filter_by].to_sym, permited_params[:query])
    else
      @campaigns = Campaign.all
    end

    render json: @campaigns, status: :ok
  rescue ArgumentError => error
    render json: { error: error.message }, status: :unprocessable_entity
  end

  private

  def permited_params
    params.permit(:filter_by, :query)
  end
end
