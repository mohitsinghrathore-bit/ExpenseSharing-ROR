class GroupService::AddGroup<ApplicationService

  attr_reader :group_params

  def initialize(user)
    @group_params=user
  end
  def call
    group = Group.new(group_params)
    group.save
  end

end