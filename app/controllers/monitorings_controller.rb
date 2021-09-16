class MonitoringsController < ApplicationController
  before_action :authenticate_user!

  def index
    @monitorings = Monitoring.all
  end

  def show
    @monitoring = Monitoring.find(params[:id])
  end

  def new
    @monitoring = Monitoring.new
  end

  def create
    @monitoring = Monitoring.new(monitoring_params)

    if @monitoring.save
      redirect_to @monitoring
    else
      render :new
    end
  end

  def edit
    @monitoring = Monitoring.find(params[:id])
  end

  def update
    @monitoring = Monitoring.find(params[:id])

    if @monitoring.update(monitoring_params)
      redirect_to @monitoring
    else
      render :edit
    end
  end

  def destroy
    @monitoring = Monitoring.find(params[:id])
    @monitoring.destroy

    redirect_to root_path
  end

  def switch_status
    @monitoring = Monitoring.find(params[:id])
    @monitoring.update(status: !@monitoring.status)
    @monitoring.update(warning_message: nil)

    redirect_to root_path
  end

  private

  def monitoring_params
    params.require(:monitoring).permit(:service_title, :service_address, :warning_message)
  end
end