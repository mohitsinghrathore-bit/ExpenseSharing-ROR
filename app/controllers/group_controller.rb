class GroupController<ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    GroupService.addGroup(group_params)
  end
  def balanceAtGrouplevel
    auditTable=AuditService.auditWithGrpId(params[:id])
    render json: auditTable
  end
  def datewiseSegregation
    auditTable=AuditService.auditTrailDatewise(params)
    render json: auditTable
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end
end
