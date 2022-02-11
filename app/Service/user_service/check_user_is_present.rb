class UserService::CheckUserIsPresent<ApplicationService

  attr_reader :user_id
  def initialize(user_id)
    @user_id=user_id
  end
  def call
    return User.where(id: user_id).present?
  end
end
