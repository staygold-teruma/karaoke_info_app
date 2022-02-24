module FeeGuidesHelper
  def sum_count(count_a, count_b)
    count_a + count_b
  end

  def ratio(numerator, denominator)
    if numerator == 0 || denominator == 0
      0
    else
      percentage = numerator.to_f / denominator * 100
      percentage.round(1)
    end
  end

  def footer_item
    if shop_signed_in?
      render partial: "footer_item_shop"
    else
      render partial: "footer_item_user"
    end
  end
end
