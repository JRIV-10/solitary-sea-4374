class SearchController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @facade = SearchFacade.new(params[:search])
  end
end