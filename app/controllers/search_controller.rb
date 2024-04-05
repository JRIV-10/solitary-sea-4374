class SearchController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @facade = SearchFacade.new(params[:search])
    @members = @facade.nations_search
  end
end