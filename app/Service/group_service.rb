class GroupService
  class << self
  def addGroup(group_params)
    @group=Group.new(group_params)
    @group.save
  end
  end
end
