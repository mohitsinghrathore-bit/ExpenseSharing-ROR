class AuditService
  class << self
    def auditWithGrpId(groupId)
      user = GroupUser.where(group_id: groupId)
      allUsers = user.pluck(:user_id)
      auditTable = AuditTable.where(idUser1: allUsers).or(AuditTable.where(idUser2: allUsers))
      return auditTable
    end
    def auditWithUsrId(userId)
      auditTable=AuditTable.where(idUser1: userId).or(AuditTable.where(idUser2: userId))
      return auditTable
    end
  end
end
