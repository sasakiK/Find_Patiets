class ResultsController < ApplicationController
  def index
    @results = Result.search(params[:search])
  end
end
