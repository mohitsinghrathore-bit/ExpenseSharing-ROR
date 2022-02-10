class AuditService
  class << self
    def auditWithGrpId(groupId)
      auditTable = AuditTable.where(group_id: groupId)
      # allUsers = user.pluck(:user_id)
      # auditTable = AuditTable.where(idUser1: allUsers).or(AuditTable.where(idUser2: allUsers))
      return auditTable
    end
    def auditWithUsrId(userId)
      auditTable=AuditTable.where(idUser1: userId).or(AuditTable.where(idUser2: userId))
      return auditTable
    end
    def UpdateAudit (amountDistributed, txn_params)
      @groupuser = GroupUser.where(group_id: txn_params[:groupId])
      @groupuser.each { |groupUser|
        if groupUser.user_id == txn_params[:userId]
          next
        end
        @audittable = AuditTable.where(idUser2: txn_params[:userId]).where(idUser1: groupUser.user_id)
        if @audittable.present?
          audittable = AuditTable.where(idUser2: txn_params[:userId]).where(idUser1: groupUser.user_id)
          audittable[0].amount += amountDistributed
          audittable[0].save
        else
          @audittable = AuditTable.new(idUser1: groupUser.user_id, idUser2: txn_params[:userId], amount: amountDistributed,group_id:txn_params[:groupId])
          @audittable.save
        end
      }
    end

    def auditTrailDatewise(params)
      auditTable=AuditService.auditWithGrpId(params[:id])
      auditTable.group(:created_at)
      return auditTable
    end
  end
end
