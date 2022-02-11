class TransactionController < ApplicationController
  skip_before_action :verify_authenticity_token
  #doing the transaction with inputs userId(who pays),groupId and amount
  def do_transaction
    is_user_present = UserService::CheckUserIsPresent.call(txn_params[:user_id])
    if is_user_present
      amount_distributed = AuditService::TxnAmount.call(txn_params)
      AuditService::UpdateAudit.call(amount_distributed, txn_params)
    else
      render json: { "msg": "Enter the correct user" }
    end
  end

  private
  def txn_params
    params.require(:txn).permit(:user_id, :groupId, :amount)
  end
end


