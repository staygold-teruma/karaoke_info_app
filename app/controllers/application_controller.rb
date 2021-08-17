class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                        :email,
                                        :name,
                                        :phone_number,
                                        :postcode,
                                        :prefecture_name,
                                        :address_city,
                                        :address_street,
                                        :address_building,
                                        :image
                                      ])
  end
end
