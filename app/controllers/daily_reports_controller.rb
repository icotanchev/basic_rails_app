require 'pry'

class DailyReportsController < ApplicationController
  respond_to :xml, :html

  def index
  end
  
  def add_daily_report_fields
    @counter = params[:counter]
    respond_to do |format|
      format.js
    end
  end

  def add_daily_cost_fields
    respond_to do |format|
      format.js
    end
  end

  def export_daily_report
    if params[:company_1] == ''
      render 'index.html.haml' 

    else
      @file = noemalize_params(params)
      
      filename = "#{Time.now.to_s(:db)[0..10]}_#{@file[:person]}"
      respond_to do |format|
        format.xls do
          response.headers['Content-Disposition'] = 'attachment; filename="' + filename + '.xls"'
          render "export_daily_report.xls.erb"
        end
      end
    end
  end

  private

  def noemalize_params(params)
    hash = {}
    client = ''
    hash[:person] = params[:person]
    hash[:total_amount] = params[:hidden_field_total_amount_id]    
    hash[:daily_cost] = []

    (1..params[:counter].to_i).to_a.each do |row|
      hash[:daily_cost] << [params["cost_#{row}"], params["cost_additional_info_#{row}"]]
      if params["company_#{row}"] != ''
        client = params["company_#{row}"]
        hash[params["company_#{row}"]] = [[params["price_#{row}"], params["additional_info_#{row}"]]]
      else
        hash[client] << [params["price_#{row}"], params["additional_info_#{row}"]]
      end
    end
    hash
  end
end
