class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: [:show, :edit, :update, :destroy]
  respond_to :xml, :html

  def index
    @daily_reports = DailyReport.order(created_at: :desc)
  end

  def new
    @daily_report = DailyReport.new
  end

  def create
    if params && params[:company_1] != '' && params[:person] != '' && params[:hidden_field_total_amount_id] != ''
      hash = normalize_params(params) 
      @daily_report = DailyReport.create!(daily_report: hash, user_id: params[:person], price: hash[:total_amount])
      redirect_to daily_reports_path, notice: 'Daily Report was successfully created.'
    else
      redirect_to root_path, notice: 'Daily Report was not created!'
    end
  end
  
  def add_daily_report_fields
    @counter = params[:counter]
    respond_to do |format|
      format.js
    end
  end

  def add_daily_cost_fields
    @cost_counter = params[:cost_counter]
    respond_to do |format|
      format.js
    end
  end

  def export_daily_report
    @file = []
    DailyReport.find(params[:export_reports].keys).each { |report| @file << report.daily_report }

    respond_to do |format|
      format.xls do
        response.headers['Content-Disposition'] = 'attachment; filename='"#{Time.now.to_s(:db)[0..10]}.xls"''
        render "export_daily_report.xls.erb"
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_report
    @client = DailyReport.find(params[:id])
  end

  def daily_report_params
    params.require(:daily_report).permit(:daily_report, :user_id, :price)
  end

  def normalize_params(params)
    hash = {}
    client = ''
    hash[:person] = User.find(params[:person].to_i).first_name
    hash[:total_amount] = params[:hidden_field_total_amount_id]
    hash[:daily_cost] = []

    (1..params[:counter].to_i).to_a.each do |row|
      if params["company_#{row}"] != ''
        client = params["company_#{row}"]
        hash[params["company_#{row}"]] = [[params["price_#{row}"], params["additional_info_#{row}"]]]
      else
        hash[client] << [params["price_#{row}"], params["additional_info_#{row}"]]
      end
    end

    (1..params[:cost_counter].to_i).to_a.each do |costs|
      hash[:daily_cost] << [params["cost_#{costs}"], params["cost_additional_info_#{costs}"]] if params["cost_#{costs}"]
    end

    hash
  end
end
