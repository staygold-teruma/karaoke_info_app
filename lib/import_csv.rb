require "csv"

class ImportCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    # インポートするデータを格納するための空配列
    list = []
    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    # メソッドの戻り値をインポートしたデータの配列とする
    list
  end

  def self.user_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import("db/csv/user.csv")

    puts "インポート処理を開始"
    User.create!(list)
    puts "インポート完了!"
  end

  def self.shop_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import("db/csv/shop.csv")

    puts "インポート処理を開始"
    Shop.create!(list)
    puts "インポート完了!"
  end

  def self.main_plan_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import("db/csv/mainplan.csv")

    puts "インポート処理を開始"
    MainPlan.create!(list)
    puts "インポート完了!"
  end

  def self.drink_plan_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import("db/csv/drinkplan.csv")

    puts "インポート処理を開始"
    DrinkPlan.create!(list)
    puts "インポート完了!"
  end

  def self.topic_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import("db/csv/topic.csv")

    puts "インポート処理を開始"
    Topic.create!(list)
    puts "インポート完了!"
  end
end
