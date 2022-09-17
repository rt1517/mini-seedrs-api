require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :image_url }
  it { is_expected.to validate_presence_of :country }
  it { is_expected.to validate_presence_of :sector }
  it { is_expected.to validate_presence_of :percentage_raised }
  it { is_expected.to validate_presence_of :target_amount }
  it { is_expected.to validate_presence_of :investment_multiple }

  describe '#update_percentage_raised' do
    let!(:campaign) do
      FactoryBot.create :campaign,
      investment_multiple: 2,
      target_amount: 100,
      percentage_raised: 0
    end

    let!(:investment) { campaign.investments.create!(amount: 40) }

    it 'updates the percentage raised' do
      campaign.percentage_raised
      expect { campaign.update_percentage_raised(investment) }.
        to change { campaign.percentage_raised }.by(40.to_d)
    end
  end
end
