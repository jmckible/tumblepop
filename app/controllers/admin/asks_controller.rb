class Admin::AsksController < Admin::AdminController
  
  # POST /admin/asks
  def create
    @ask = Ask.new params[:ask]
    @ask.save!
    redirect_to [:admin, @ask.user]
  end
  
end
