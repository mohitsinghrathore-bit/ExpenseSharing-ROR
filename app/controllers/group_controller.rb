class GroupController < ApplicationController
  skip_before_action :verify_authenticity_token
  #creating the group
  def create
    GroupService::AddGroup.call(group_params)
  end

  #showing the transaction status of all user in given group
  def balance_at_group_level
    auditTable = AuditService::AuditWithGrpId.call(params[:id])
    render json: auditTable
  end

  #ordering by date the audit trails of given group
  def datewise_segregation
    auditTable = AuditService::AuditTrailDatewise.call(params)
    render json: auditTable
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
