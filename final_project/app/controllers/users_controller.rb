class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update]
  # :destroy
  # before_action :login_required
  # skip_before_action :login_required, only: [:new, :create]

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def validate_user
    # redirect_to :back unless current_user == User.find(params[:id])
  end

  private

  def user_params
  end

  def set_user
    @student = Student.find(params[:id])
  end

end
