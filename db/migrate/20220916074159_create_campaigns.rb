class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :country, null: false
      t.string :sector, null: false
      t.decimal :percentage_raised, null: false
      t.decimal :target_amount, null: false
      t.decimal :investment_multiple, null: false
    end
  end
end
