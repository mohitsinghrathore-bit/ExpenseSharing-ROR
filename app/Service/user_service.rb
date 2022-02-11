class UserService
  class << self
    def checkUserIsPresent(userId)
      return User.where(id: userId).present?
    end

    def addUser(user_params)
      @user = User.new(user_params[:user])
      @user.save
      @groupuser = GroupUser.new(user_id: @user.id, group_id: user_params[:group_id][:id])
      @groupuser.save
    end
  end
end
