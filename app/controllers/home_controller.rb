class HomeController < ApplicationController
  
  def index
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
end
