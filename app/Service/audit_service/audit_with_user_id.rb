class AuditWithUserId
end
class AuditService::AuditWithUserId < ApplicationService

  attr_reader :user_id

  def initialize(user_id)
    @user_id=user_id
  end

  def call
    audit_table=AuditTable.where(idUser1: user_id).or(AuditTable.where(idUser2: user_id))
    return audit_table
  end

end