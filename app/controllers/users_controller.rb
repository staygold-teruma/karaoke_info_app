class UsersController < ApplicationController
  def show
    @user = current_user
    @shops = @user.favorited_shops
  end
end
