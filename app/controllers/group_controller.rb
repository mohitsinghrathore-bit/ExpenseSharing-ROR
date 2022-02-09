class GroupController<ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @group=Group.new(group_params)
    @group.save
  end
  def balanceAtGrouplevel
    auditTable=AuditService.auditWithGrpId(params[:id])
    render json: auditTable
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end
end
