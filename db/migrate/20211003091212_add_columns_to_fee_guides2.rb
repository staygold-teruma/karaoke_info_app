class AddColumnsToFeeGuides2 < ActiveRecord::Migration[6.1]
  def change
    change_table :fee_guides, bulk: true do |t|
      t.references :shop, foreign_key: true
      t.datetime :start_time
    end
  end
end
