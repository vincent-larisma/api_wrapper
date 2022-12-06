class NasaApi::Client
  class NasaApiError < StandardError; end
  class AsteroidIdNotFound < NasaApiError; end

  BASE_URL = Rails.application.credentials.nasa[:nasa_base_url]
  API_KEY = Rails.application.credentials.nasa[:nasa_api_key]

  ERROR_CODES = {
    404 => AsteroidIdNotFound
  }

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
    params = params.merge(api_key: API_KEY)
    response = connection.send('get', endpoint, params) 
    return JSON.parse(response.body) if response.success?
    raise ERROR_CODES[response.status]

  end

  def connection
    @connection ||= Faraday.new(url: BASE_URL)
  end
end
