require "csv"

class ImportDrinkPlanCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    puts "ドリンク料金の初期データインポート処理を開始"
    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      shop = Shop.find_by(id: row["shop_id"])
      DrinkPlan.create!(fee_type: row["fee_type"].to_i,
                        div_time: row["div_time"].to_i,
                        base_time: row["base_time"].to_i,
                        adult_fee: row["adult_fee"].to_i,
                        student_fee: row["student_fee"].to_i,
                        senior_fee: row["senior_fee"].to_i,
                        child_fee: row["child_fee"].to_i,
                        extension_adult_fee: row["extension_adult_fee"].to_i,
                        extension_student_fee: row["extension_student_fee"].to_i,
                        extension_senior_fee: row["extension_senior_fee"].to_i,
                        extension_child_fee: row["extension_child_fee"].to_i,
                        note: row["note"],
                        shop_id: shop.id)
    end
    puts "ドリンク料金のインポート完了!"
  end
end
