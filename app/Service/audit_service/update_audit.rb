class AuditService::UpdateAudit < ApplicationService

  attr_reader :amount_distributed, :txn_params

  def initialize(amount_distributed,txn_params)
    @amount_distributed=amount_distributed
    @txn_params=txn_params
  end

  def call
    group_user = GroupUser.where(group_id: txn_params[:groupId])
    group_user.each { |groupUser|
      if groupUser.user_id == txn_params[:user_id]
        next
      end
      audit_table = AuditTable.where(idUser2: txn_params[:user_id]).where(idUser1: groupUser.user_id)
      if audit_table.present?
        audit_table = AuditTable.where(idUser2: txn_params[:user_id]).where(idUser1: groupUser.user_id)
        audit_table[0].amount += amount_distributed
        audit_table[0].save
      else
        audit_table = AuditTable.new(idUser1: groupUser.user_id, idUser2: txn_params[:user_id], amount: amount_distributed, group_id:txn_params[:groupId])
        audit_table.save
      end
    }
  end

end