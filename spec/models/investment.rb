require 'rails_helper'

RSpec.describe Investment, type: :model do
  it { is_expected.to validate_presence_of :amount }

  describe 'validates amount according to investment multiple' do
    let!(:campaign) do
      FactoryBot.create :campaign,
      investment_multiple: 2,
      target_amount: 100,
      percentage_raised: 0
    end

    context 'when amount is multiple of campaigns investment_multiple' do
      it 'allows to create investment' do
        expect { campaign.investments.create!(amount: 4) }.not_to raise_error
      end
    end

    context 'when amount is not multiple of campaigns investment_multiple' do
      it 'raises error' do
        expect { campaign.investments.create!(amount: 3) }.to raise_error
      end
    end
  end
end
