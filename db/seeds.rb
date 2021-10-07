# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "import_mainplan_csv"
require "import_drinkplan_csv"
require "import_topic_csv"

%w[shops main_plans drink_plans topics].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

shop1 = Shop.create!(name: "サンプル店舗梅田店", email: "example1@example.com", password: "password1")
shop2 = Shop.create!(name: "サンプル店舗三宮店", email: "example2@example.com", password: "password2")
ImportMainPlanCsv.import("db/csv/mainplan.csv")
ImportDrinkPlanCsv.import("db/csv/drinkplan.csv")
ImportTopicCsv.import("db/csv/topic.csv")
