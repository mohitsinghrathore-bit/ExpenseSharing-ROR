class AuditService::TxnAmount < ApplicationService

  attr_reader :txn_params

  def initialize(txn_params)
    @txn_params=txn_params
  end

  def call
    total_user = GroupUser.where(group_id: txn_params[:groupId]).count
    amount_distributed = (txn_params[:amount]) / (total_user)
    return amount_distributed
  end

end