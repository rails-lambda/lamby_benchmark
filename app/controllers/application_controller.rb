class ApplicationController < ActionController::Base
  def index
    sleep(rand(2))
    render
  end
end
