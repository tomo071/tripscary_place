class ReportsController < ApplicationController
before_action :authenticate_user!

  def create
    information = Information.find(params[:information_id])
    report = Report.new(user_id: current_user.id, comment_id: report_params)
    report.save
    redirect_to information_path(information)
  end

  def destroy
    information = Information.find(params[:information_id])
    report = Report.find_by(comment_id: report_params)
    report.destroy
    redirect_to information_path(information)
  end

  def report_params
    params.require(:comment_id)
  end

end
