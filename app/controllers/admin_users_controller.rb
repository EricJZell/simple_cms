class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @users = AdminUser.sorted
  end

  def new
    @user = AdminUser.new
  end

  def create

  end

  def edit
  end

  def delete
  end
end
