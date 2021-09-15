class Users::ApplicationController < ActionController::Base
  layout "users/application"
  before_action :authenticate_user!
end
