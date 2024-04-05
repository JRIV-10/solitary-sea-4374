class SearchService 

  def nations 
    get_url("/api/v1/characters?affiliation=NATION+NAME")
  end

  def get_url(url) 
    response = conn.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    conn = Faraday.new(url: "http://last-airbender-api.fly.dev") 
  end
end