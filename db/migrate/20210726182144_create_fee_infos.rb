class CreateFeeInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :fee_infos do |t|
      t.integer :div_member, null: false, default: 1
      t.integer :number_of_adults, null: false, default: 0
      t.integer :number_of_students, null: false, default: 0
      t.integer :number_of_seniors, null: false, default: 0
      t.integer :number_of_children, null: false, default: 0
      t.integer :usage_time, null: false, default: 0
      t.integer :drink_plan, null: false, default: 0
      t.integer :number_of_customers, null: false
      t.integer :total_fee, null: false

      t.timestamps
    end
  end
end
