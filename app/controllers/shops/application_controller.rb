class Shops::ApplicationController < ApplicationController
  layout "shops/application"
  before_action :authenticate_shop!
end
