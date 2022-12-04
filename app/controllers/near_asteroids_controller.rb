class NearAsteroidsController < ApplicationController
  rescue_from 'NasaApi::Client::AsteroidIdNotFound', with: :asteroid_id_not_found

  def index
    client = NasaApi::Client.new
    @neo_browse = client.neo_browse
  end

  def show
    client = NasaApi::Client.new
    @asteroid_info = client.neo_search(params[:id])
  end

  private

  def asteroid_id_not_found
    render plain: 'asteroid id not found'
  end
end
