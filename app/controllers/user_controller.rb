class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  #showing all the user
  def show
    render json: User.all
  end

  #creating the user
  def create
    UserService::AddUser.call(user_params)
  end

  #updating the user with inputs
  def update_user
    UserService::UpdateUser.call(params, user_param_upd)
  end

  #showing user transaction status
  def balance_at_user_level
    audit_table = AuditService::AuditWithUserId.call(params[:id])
    render json: audit_table
  end

  private

  def user_params
    user_param, group_param = params.require([:user, :group_id])
    {
      user: user_param.permit(:name, :contactNo, :email),
      group_id: group_param.permit(:id)
    }
  end

  def user_param_upd
    params.require(:user).permit(:name, :contactNo, :email)
  end
end
