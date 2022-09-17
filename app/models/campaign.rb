class Campaign < ApplicationRecord
  include PgSearch::Model

  has_many :investments, dependent: :destroy

  validates :name, :image_url, :country, :sector, :percentage_raised, :target_amount, :investment_multiple, presence: true

  pg_search_scope :search_by_column, lambda { |column, query|
    raise ArgumentError, "filter_by only allows #{attribute_names.join(',')}" unless attribute_names.map(&:to_sym).include?(column)
    {
      against: column,
      query: query,
    }
  }

  def update_percentage_raised(investment)
    investment_percentage_raised = (investment.amount / target_amount) * 100
    total_percentage_raised = percentage_raised + investment_percentage_raised
    update!(percentage_raised: total_percentage_raised)
  end
end
