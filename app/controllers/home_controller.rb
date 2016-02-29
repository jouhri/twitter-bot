class HomeController < ApplicationController
  def index
    cookies.delete :max_id
  end
end
