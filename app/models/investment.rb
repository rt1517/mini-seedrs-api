class Investment < ApplicationRecord
    belongs_to :campaign

    validates :amount, presence: true

    validate :amount_must_be_multiple_of_campaign_investment_multiple


    def amount_must_be_multiple_of_campaign_investment_multiple
      return unless amount && campaign

      if (amount % campaign.investment_multiple).nonzero?
        errors.add(:amount, "must be multiple of campaign investment multiple")
      end
    end
end
