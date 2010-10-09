class Admin::UsersController < Admin::AdminController
  
  # GET /admin/users
  def index
    @users = User.all.paginate :page=>params[:page]
  end
  
  # GET /admin/users/:id
  def show
    @user = User.find params[:id]
  end
  
  # GET /admin/users/new
  def new
    @user = User.new
  end
  
  # POST /admin/users
  def create
    @user = User.new params[:user]
    password = @user.reset_password
    @user.save!
    redirect_to [:admin, @user]
  rescue ActiveRecord::RecordInvalid
    render :new
  end
  
  # PUT /admin/users/:id
  def update
    @user = User.find params[:id]
    @user.update_attributes! params[:user]
    redirect_to [:admin, @user]
  rescue ActiveRecord::RecordInvalid
    render :show
  end
  
  # PUT /admin/users/:id/toggle_admin
  def toggle_admin
    @user = User.find params[:id]
    @user.toggle! :admin
    redirect_to [:admin, @user]
  end
  
end
