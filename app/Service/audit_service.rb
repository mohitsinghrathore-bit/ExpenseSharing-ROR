class AuditService
  class << self
    def auditWithGrpId(id)
      user = GroupUser.where(group_id: id)
      allUsers = user.pluck(:user_id)
      auditTable = AuditTable.where(idUser1: allUsers).or(AuditTable.where(idUser2: allUsers))
      return auditTable
    end
  end
end
