class Admin::DaysController < AdminController
  
  # GET /admin/days
  def index
    @days = Day.all
  end
  
  # POST /admin/days
  def create
    @day = Day.new params[:day]
    if @day.valid?
      @day = Day.new params[:day]
      @day.save
    else
      @day = Day.find_by_date @day.date
      @day.update_attributes params[:day]
    end    
    redirect_to admin_days_url
  end
  
end