class TransactionController<ApplicationController
  skip_before_action :verify_authenticity_token
  @@txnService=TransactionService.new
  def doTransaction
    amountDistributed=@@txnService.txnAmount(txn_params)
    @@txnService.UpdateAudit(amountDistributed,txn_params)
  end

  private
  def txn_params
    params.require(:txn).permit(:userId, :groupId, :amount)
  end
end


