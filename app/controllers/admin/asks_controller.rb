class Admin::AsksController < AdminController
  
  # POST /admin/asks
  def create
    @ask = Ask.new params[:ask]
    @ask.save!
    redirect_to [:admin, @ask.user]
  end
  
  # PUT /admin/asks/:id/deliver
  def deliver
    @ask = Ask.find params[:id]
    AskMailer.inquiry(@ask).deliver
    redirect_to [:admin, @ask.user]
  end
  
end
