class PcategoryController < ApplicationController
  def index
    @pcategories = Pcategory.all
  end

  def show
      @pcategory = Pcategory.friendly.find(params[:id])
  end


end
