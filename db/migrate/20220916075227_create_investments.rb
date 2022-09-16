class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments, id: :uuid do |t|
      t.uuid :campaign_id
      t.decimal :amount, null: false
    end

    add_index :investments, :campaign_id
  end
end
