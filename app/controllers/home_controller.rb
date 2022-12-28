class HomeController < ApplicationController
  require "net/http"
  require "uri"

  def index
    uri = URI.parse("http://0.0.0.0:8080/echo?msg=hello") 
    response = Net::HTTP.get_response(uri)
    @hello = response.body

    uri = URI("http://0.0.0.0:8080/sum")
    response = Net::HTTP.post_form(uri, "a" => 5, "b" => 7)
    #@sum = JSON.parse(response.body)
    @sum = response.body

    uri = URI("http://0.0.0.0:8080/viridis")
    response = Net::HTTP.get_response(uri)

    @viridis = response.body

  end
end
