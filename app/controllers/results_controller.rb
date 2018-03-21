class ResultsController < ApplicationController
  def index
    @results = Result.search(params[:search])
    @judge = @results.length
  end
end
