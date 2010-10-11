class Admin::ReadsController < AdminController
  
  # PUT /admin/reads/:id/toggle
  def toggle
    @read = Read.find params[:id]
    @read.toggle! :allowed
    redirect_to [:admin, @read.writer]
  end
  
end
