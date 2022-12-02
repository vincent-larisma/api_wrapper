class NasaApi::Client
  BASE_URL = 'https://api.nasa.gov'
  API_KEY = 'VxQfdK5XlsfAXY0UFcr2CJFAhmZh8f7BIv2vx7Ez'

  def astronomy_picture
    connection = Faraday.new(url: BASE_URL, params: { api_key: API_KEY, count: rand(20) })
    response = connection.get('planetary/apod')
    JSON.parse(response.body)
  end

  def tech_transfer
    connection = Faraday.new(url: BASE_URL, params: { api_key: API_KEY })
    response = connection.get('techtransfer/patent/?engine')
    JSON.parse(response.body)
  end

  def neo_browse
    connection = Faraday.new(url: BASE_URL, params: { api_key: API_KEY })
    response = connection.get('/neo/rest/v1/neo/browse?')
    JSON.parse(response.body)['near_earth_objects']
  end

  def neo_search(id)
    connection = Faraday.new(url: BASE_URL, params: { api_key: API_KEY })
    response = connection.get("/neo/rest/v1/neo/#{id}?")
    JSON.parse(response.body)
  end
end
