class ChangeFeeInfosToFeeGuides < ActiveRecord::Migration[6.1]
  def change
    rename_table :fee_infos, :fee_guides
  end
end
