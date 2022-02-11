class AuditService::AuditWithGrpId < ApplicationService

  attr_reader :groupId

    def initialize(groupId)
      @groupId=groupId
    end

  def call
    auditTable = AuditTable.where(group_id: groupId)
    return auditTable
  end

end