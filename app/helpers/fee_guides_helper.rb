module FeeGuidesHelper
  def ratio(numerator, denominator)
    numerator.to_f / denominator * 100
  end
end
