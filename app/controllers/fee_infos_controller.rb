class FeeInfosController < ApplicationController
  def index
    @fee_infos = FeeInfo.all
  end

  def new
    @fee_info = FeeInfo.new
  end

  def create
    fee_info = FeeInfo.new(fee_info_params)

    # 合計人数を計算
    total_customers = fee_info[:number_of_adults] + fee_info[:number_of_students] + fee_info[:number_of_seniors] + fee_info[:number_of_children]

    # 営業日がどの曜日区分かを確定
    day = FeeInfo.get_day

    # 30分単位料金を乗算するカウントを取得
    main_count = FeeInfo.usage_times[fee_info.usage_time] + 1
    # 昼料金と夜料金のカウント数を取得
    unit_count = FeeInfo.get_count(main_count)

    # フォームで取得した内容から該当の「昼料金を取得」
    chosen_day_plan = MainPlan.find_by(div_member: fee_info[:div_member], div_day: day, div_time: 0, time_unit: 0)
    # フォームで取得した内容から該当の「夜料金を取得」
    chosen_night_plan = MainPlan.find_by(div_member: fee_info[:div_member], div_day: day, div_time: 1, time_unit: 0)

    # 選んだプランからルーム料金を計算
    number_of_people = [fee_info[:number_of_adults], fee_info[:number_of_students], fee_info[:number_of_seniors], fee_info[:number_of_children]]

    # それぞれの一人当たりのルーム料金を計算
    adult_main_fee = chosen_day_plan[:adult_fee] * unit_count[0] + chosen_night_plan[:adult_fee] * unit_count[1]
    student_main_fee = chosen_day_plan[:student_fee] * unit_count[0] + chosen_night_plan[:student_fee] * unit_count[1]
    senior_main_fee = chosen_day_plan[:senior_fee] * unit_count[0] + chosen_night_plan[:senior_fee] * unit_count[1]
    child_main_fee = chosen_day_plan[:child_fee] * unit_count[0] + chosen_night_plan[:child_fee] * unit_count[1]

    # ルーム料金合計を取得
    total_main_plan_fee = adult_main_fee * fee_info[:number_of_adults] +
                          student_main_fee * fee_info[:number_of_students] +
                          senior_main_fee * fee_info[:number_of_seniors] +
                          child_main_fee * fee_info[:number_of_children]

    # ドリンクコースの名前を取得
    drink_plan = FeeInfo.get_drink_plan(fee_info[:drink_plan])

    # ドリンクコースの時間単位を取得
    drink_unit = FeeInfo.get_drink_unit(drink_plan)

    # ドリンクコースの30分単位料金を乗算するカウントを取得
    drink_count = FeeInfo.get_drink_count(drink_plan)

    # フォームで取得した内容から該当の「ドリンクコースを取得」
    chosen_drink_plan = DrinkPlan.find_by(name: drink_plan, time_unit: drink_unit)

    # それぞれのドリンク料金を計算
    adult_drink_fee = chosen_drink_plan[:adult_fee] * drink_count
    student_drink_fee = chosen_drink_plan[:student_fee] * drink_count
    senior_drink_fee = chosen_drink_plan[:senior_fee] * drink_count
    child_drink_fee = chosen_drink_plan[:child_fee] * drink_count

    # ドリンク料金を計算
    total_drink_plan_fee = adult_drink_fee * fee_info[:number_of_adults] +
                           student_drink_fee * fee_info[:number_of_students] +
                           senior_drink_fee * fee_info[:number_of_seniors] +
                           child_drink_fee * fee_info[:number_of_children]

    # フォームで取得していないパラメータを書き換え
    fee_info["number_of_customers"] = total_customers
    fee_info["total_fee"] = total_main_plan_fee + total_drink_plan_fee
    # fee_info["adult_main_fee"] = adult_main_fee
    # fee_info["student_main_fee"] = student_main_fee
    # fee_info["senior_main_fee"] = senior_main_fee
    # fee_info["child_main_fee"] = child_main_fee
    # fee_info["adult_drink_fee"] = adult_drink_fee
    # fee_info["student_drink_fee"] = student_drink_fee
    # fee_info["senior_drink_fee"] = senior_drink_fee
    # fee_info["child_drink_fee"] = child_drink_fee
    # fee_info["adult_total_fee"] = adult_main_fee + adult_drink_fee
    # fee_info["student_total_fee"] = student_main_fee + student_drink_fee
    # fee_info["senior_total_fee"] = senior_main_fee + senior_drink_fee
    # fee_info["child_total_fee"] = child_main_fee + child_drink_fee
    @fee_info = fee_info

    if @fee_info.save!
      redirect_to fee_infos_path
    else
      render :new
    end
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
