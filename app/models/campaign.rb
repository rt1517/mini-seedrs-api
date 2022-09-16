class Campaign < ApplicationRecord
  has_many :investments, dependent: :destroy

  validates :name, :image_url, :country, :sector, :percentage_raised, :target_amount, :investment_multiple, presence: true

  def update_percentage_raised(investment)
      investment_percentage_raised = (investment.amount / target_amount) * 100
      total_percentage_raised = percentage_raised + investment_percentage_raised
      update!(percentage_raised: total_percentage_raised)
  end
end
