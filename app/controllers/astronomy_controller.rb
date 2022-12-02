class AstronomyController < ApplicationController
  def index
    client = NasaApi::Client.new
    @astronomy = client.astronomy_picture
  end
end
