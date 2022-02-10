class TransactionController<ApplicationController
  skip_before_action :verify_authenticity_token
  #@@txnService=TransactionService.new
  def doTransaction
    amountDistributed=TransactionService.txnAmount(txn_params)
    AuditService.UpdateAudit(amountDistributed,txn_params)
  end

  private
  def txn_params
    params.require(:txn).permit(:userId, :groupId, :amount)
  end
end


