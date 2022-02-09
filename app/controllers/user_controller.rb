class UserController<ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    render json: User.all
  end
  def create
    @user=User.new(user_params[:user])
    @user.save
    @groupuser=GroupUser.new(user_id:@user.id,group_id:user_params[:group_id][:id])
    @groupuser.save
  end
  def balanceAtUserlevel
    auditTable=AuditService.auditWithUsrId(params[:id])
    render json: auditTable
  end
  private
  def user_params
    userparam, groupparam = params.require([:user, :group_id])
    {
      user: userparam.permit(:name, :contactNo,:email),
      group_id: groupparam.permit(:id)
    }
  end
end
