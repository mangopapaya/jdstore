class PcategoriesController < ApplicationController

  def index
    @pcategories = Pcategory.all
  end

  def show
    @pcategory = Pcategory.find(params[:id])
  end


end
