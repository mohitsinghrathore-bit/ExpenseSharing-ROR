class AuditService::AuditTrailDatewise < ApplicationService

  attr_reader :params

  def initialize(params)
    @params=params
  end

  def call
    audit_table=AuditService.auditWithGrpId(params[:id])
    audit_table.order(:created_at)
    return audit_table
  end

end