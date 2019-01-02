class ApplicationController < ActionController::API
	before_action :set_cors_headers

  private

  def set_cors_headers
    response.set_header "Access-Control-Allow-Origin", origin
  end

  def origin
    request.headers["Origin"] || "*"
  end
end
