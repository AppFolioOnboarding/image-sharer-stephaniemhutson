class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @text = 'Hello world'
  end
end
