class Admin::PcategoriesController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @pcategories = Pcategory.all
  end

  def new
    @pcategory = Pcategory.new
  end

  def create
    @pcategory = Pcategory.new(pcategory_params)
    if @pcategory.save
      redirect_to admin_pcategories_path
    else
      render :new
    end
  end

  def show
    # if (params[:id].present?)
    @pcategory = Pcategory.find(params[:id])
    # end
  end

  def edit
    @pcategory = Pcategory.find(params[:id])
  end

  def update
    @pcategory = Pcategory.find(params[:id])
    if @pcategory.update(pcategory_params)
      redirect_to admin_pcategories_path
    else
      render :edit
    end
  end

  def destroy
    @pcategory = Pcategory.find(params[:id])
    @pcategory.destroy
    redirect_to admin_pcategories_path, warning:"Category deleted"
  end

  private

  def pcategory_params
    params.require(:pcategory).permit(:program_id, :name, :id, :description)
  end

end
