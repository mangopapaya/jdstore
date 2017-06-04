class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hihi"
  end
end
