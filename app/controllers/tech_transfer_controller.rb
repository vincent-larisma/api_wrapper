class TechTransferController < ApplicationController
  def index
    client = NasaApi::Client.new
    @tech_transfer = client.tech_transfer
  end
end
