class TransactionController < ApplicationController
  skip_before_action :verify_authenticity_token
  #@@txnService=TransactionService.new
  def doTransaction
    isUserPresent = UserService.checkUserIsPresent(txn_params[:userId])
    if isUserPresent
      amountDistributed = TransactionService.txnAmount(txn_params)
      AuditService.UpdateAudit(amountDistributed, txn_params)
    else
      render json: { "msg": "Enter the correct user" }
    end
  end

  private

  def txn_params
    params.require(:txn).permit(:userId, :groupId, :amount)
  end
end


