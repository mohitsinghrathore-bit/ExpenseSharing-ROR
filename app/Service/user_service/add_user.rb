class UserService::AddUser<ApplicationService

  attr_reader :user_params

  def initialize(user)
    @user_params=user
  end
  def call
    #creating the user
    user = User.new(user_params[:user])
    user.save
    group_user = GroupUser.new(user_id: user.id, group_id: user_params[:group_id][:id])
    group_user.save
  end

end
