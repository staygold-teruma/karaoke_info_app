require "csv"

class ImportTopicCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    puts "トピックス初期データのインポート開始!"
    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      shop = Shop.find_by(id: 1)
      Topic.create!(title: row["title"],
                    content: row["content"],
                    image: File.open("./app/assets/images/img_smp_connect.jpg"),
                    shop_id: shop.id)
    end
    puts "トピックスのインポート完了!"
  end
end
