require "csv"

class ImportMainPlanCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    puts "ルーム料金の初期データインポート処理を開始"
    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      shop = Shop.find_by(id: row["shop_id"])
      MainPlan.create!(fee_type: row["fee_type"].to_i,
                       div_day: row["div_day"].to_i,
                       div_time: row["div_time"].to_i,
                       div_member: row["div_member"].to_i,
                       adult_fee: row["adult_fee"].to_i,
                       student_fee: row["student_fee"].to_i,
                       senior_fee: row["senior_fee"].to_i,
                       child_fee: row["child_fee"].to_i,
                       note: row["note"],
                       shop_id: shop.id)
    end
    puts "ルーム料金のインポート完了!"
  end
end
