# frozen_string_literal: true

module V1
  class InvestmentsController < ApplicationController
    def create
      ActiveRecord::Base.transaction do
        @investment = Investment.new(investment_params)

        if @investment.save
          @investment.campaign.update_percentage_raised(@investment)
          render json: @investment, status: :created
        else
          render json: @investment.errors.full_messages, status: :unprocessable_entity
        end
      end
    rescue StandardError => e
      render json: 'could not create investment, please try again', status: :unprocessable_entity
    end

    private

    def investment_params
      params.require(:investment).permit(:amount, :campaign_id)
    end
  end
end
