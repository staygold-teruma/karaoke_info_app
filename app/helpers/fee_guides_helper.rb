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
end
