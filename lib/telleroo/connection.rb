require 'faraday'
require 'telleroo/response/raise_client_error'
require 'telleroo/response/raise_server_error'

module Telleroo
  # Setup Faraday Connection to use for requests
  module Connection
    private

    def connection
      @connection ||= Faraday.new(url: @endpoint) do |faraday|
        faraday.use Telleroo::Response::RaiseClientError
        faraday.use Telleroo::Response::RaiseServerError
        faraday.headers['Authorization'] = @authorization_token
        faraday.headers['Content-Type'] = 'application/json'
        faraday.adapter *@http_adapter
      end
    end
  end
end
