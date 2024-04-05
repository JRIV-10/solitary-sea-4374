class SearchFacade 

  def initialize(search_params)
    # require 'pry'; binding.pry
    @search_params = search_params
  end

  def nations_search
    service = SearchService.new
    json = service.members_by_nation(@search_params) 
    nation = json.map do |nation_data|
      Nation.new(nation_data) 
    end
    require 'pry'; binding.pry
  end
end