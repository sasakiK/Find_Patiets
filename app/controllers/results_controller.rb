require 'csv'

class ResultsController < ApplicationController

  def index
    params[:search] ||= ""
    @results = Result.search(params[:search])
    temp_result = @results
    respond_to do |format|
      format.html
      format.csv {send_csv temp_result.to_csv}
    end
    @judge = @results.length
  end


  def download
    @patients = Result.find_by(id: params[:id])
  end

end
