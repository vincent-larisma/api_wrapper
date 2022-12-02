class NasaApi::Client
  BASE_URL = 'https://api.nasa.gov'.freeze
  API_KEY = 'VxQfdK5XlsfAXY0UFcr2CJFAhmZh8f7BIv2vx7Ez'.freeze

  def astronomy_picture
    request('planetary/apod', { count: rand(20) })
  end

  def tech_transfer
    request('techtransfer/patent/?engine')
  end

  def neo_browse
    request('/neo/rest/v1/neo/browse?')
  end

  def neo_search(id)
    request("/neo/rest/v1/neo/#{id}?")
  end

  private

  def request(endpoint, params = {})
    response = connection.send('get', endpoint) { |request| params.each { |k, v| request.params[k] = v } }
    JSON.parse(response.body)
  end

  def connection
    @connection ||= Faraday.new(url: BASE_URL, params: { api_key: API_KEY })
  end
end
