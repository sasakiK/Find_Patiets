require 'csv'

class ResultsController < ApplicationController
  def index
    @results = Result.search(params[:search])
    temp_result = @results
    respond_to do |format|
      format.html
      format.csv {send_csv temp_result.to_csv}
    end
    @judge = @results.length
  end

end
