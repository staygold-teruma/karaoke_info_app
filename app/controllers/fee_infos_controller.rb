class FeeInfosController < ApplicationController
  def index; end

  def new
    @fee_info = FeeInfo.new
  end

  def create
    fee_info = FeeInfo.new(fee_info_params)

    total_customers = fee_info[:number_of_adults] + fee_info[:number_of_students] + fee_info[:number_of_seniors] + fee_info[:number_of_children]

    # 曜日がどの曜日区分かを確定
    day = FeeInfo.get_day

    # 30分単位料金を乗算するカウントを取得
    count = FeeInfo.usage_times[fee_info.usage_time] + 1
    # 昼料金と夜料金のカウント数を取得
    unit_count = FeeInfo.get_count(count)

    # フォームで取得した内容から該当の「昼料金を取得」
    chosen_plan_day = MainPlan.find_by(div_member: fee_info[:div_member], div_day: day, div_time: 0, time_unit: 0)
    # フォームで取得した内容から該当の「夜料金を取得」
    chosen_plan_night = MainPlan.find_by(div_member: fee_info[:div_member], div_day: day, div_time: 1, time_unit: 0)

    # 選んだプランからルーム料金を計算
    number_of_people = [fee_info[:number_of_adults], fee_info[:number_of_students], fee_info[:number_of_seniors], fee_info[:number_of_children]]
    total_main_plan_fee = FeeInfo.calculate_main_fee(chosen_plan_day, chosen_plan_night, number_of_people, unit_count)

    # ドリンクコースの種類を取得
    drink_plan = FeeInfo.get_drink_plan(fee_info[:drink_plan])

    # フォームで取得した内容から該当の「ドリンクコースを取得」
    drink_unit = if drink_plan == "ドリンクバー料金"
                   1
                 else
                   0
                 end
    drink_count = if drink_plan == "ドリンクバー料金"
                    1
                  else
                    count
                  end
    chosen_drink_plan = DrinkPlan.find_by(name: drink_plan, time_unit: drink_unit)

    total_drink_plan_fee = FeeInfo.calculate_drink_fee(chosen_drink_plan, number_of_people, drink_count)

    total_fee_value = total_main_plan_fee + total_drink_plan_fee

    fee_info["number_of_customers"] = total_customers
    fee_info["total_fee"] = total_fee_value
    @fee_info = fee_info
    binding.pry

    # フォームで受け取ったパラメータに計算した結果をマージ
    # プライベートメソッドfee_info_value

    # 完成した保存すべきパラメータをDBに保存
    # @fee_info = FeeInfo.new(fee_info_value)
    # @fee.save
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def fee_info_params
    params.require(:fee_info).permit(:div_member, :number_of_adults, :number_of_students, :number_of_seniors, :number_of_children, :usage_time, :drink_plan)
  end
end
