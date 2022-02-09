class TransactionService
  def UpdateAudit (amountDistributed,txn_params)
    @groupuser=GroupUser.where(group_id: txn_params[:groupId])
    @groupuser.each { |groupUser|
      if groupUser.user_id == txn_params[:userId]
        next
      end
      @audittable = AuditTable.where(idUser2: txn_params[:userId]).where(idUser1: groupUser.user_id)
      if @audittable.present?
        audittable = AuditTable.where(idUser2: txn_params[:userId]).where(idUser1: groupUser.user_id)
        audittable[0].amount+=amountDistributed
        audittable[0].save
      else
        @audittable = AuditTable.new(idUser1: groupUser.user_id, idUser2: txn_params[:userId], amount: amountDistributed)
        @audittable.save
      end
    }
  end
  def txnAmount(txn_params)
    totalUser=GroupUser.where(group_id: txn_params[:groupId]).count
    amountDistributed=(txn_params[:amount])/(totalUser)
    return  amountDistributed
  end
end
