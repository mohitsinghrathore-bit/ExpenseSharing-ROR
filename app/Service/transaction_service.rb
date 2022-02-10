class TransactionService
  class << self



    def txnAmount(txn_params)
      totalUser = GroupUser.where(group_id: txn_params[:groupId]).count
      amountDistributed = (txn_params[:amount]) / (totalUser)
      return amountDistributed
    end
  end
end