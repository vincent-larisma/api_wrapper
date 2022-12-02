class NearAsteroidsController < ApplicationController
  def index
    client = NasaApi::Client.new
    @neo_browse = client.neo_browse
  end

  def show
    client = NasaApi::Client.new
    @asteroid_info = client.neo_search(params[:id])
  end
end
