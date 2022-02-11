class UserService::UpdateUser<ApplicationService
  attr_reader :params,:user_param_upd

  def initialize(params,user_param_upd)
    @params=params
    @user_param_upd=user_param_upd
  end

  def call
    user = User.find(params[:id])
    user.update(user_param_upd)
  end
end
