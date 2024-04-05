class SearchFacade 

  def initialize(search_params)
    # require 'pry'; binding.pry
    @search_params = search_params
  end

  def nations_search
    # require 'pry'; binding.pry
    service = SearchService.new
    json = service.nations(@search_params) 
  end
end