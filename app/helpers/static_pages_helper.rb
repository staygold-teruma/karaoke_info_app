module StaticPagesHelper
  def render_display_coupon
    if user_signed_in?
      render partial: "coupon_page"
    else
      render partial: "recommend_user_registration"
    end
  end
end
