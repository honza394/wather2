class HomeController < ApplicationController
  require "net/http"
  require "uri"

  def index
    uri = URI.parse("http://localhost:8000/echo?msg=hello") 
    response = Net::HTTP.get_response(uri)
    @hello = response.body

    uri = URI("http://localhost:8000/sum")
    response = Net::HTTP.post_form(uri, "a" => 5, "b" => 7)
    #@sum = JSON.parse(response.body)
    @sum = response.body

    uri = URI("http://localhost:8000/viridis")
    response = Net::HTTP.get_response(uri)

    @viridis = response.body

  end
end
