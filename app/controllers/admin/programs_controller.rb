class Admin::ProgramsController < ApplicationController
layout "admin"

before_action :authenticate_user!
before_action :admin_required

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
    @pcategories = Pcategory.all.map { |p| [p.name, p.id]}
  end

  def create
    @program = Program.new(program_params)
     @program.pcategory_id = params[:pcategory_id]
    if @program.save
      redirect_to admin_programs_path
    else
      render :new
    end
  end

  def show
    @program = Program.friendly.find(params[:id])
  end

  def edit
    @program = Program.friendly.find(params[:id])
      @pcategories = Pcategory.all.map { |p| [p.name, p.id]}
  end

  def update
    @program = Program.friendly.find(params[:id])
      @program.pcategory_id = params[:pcategory_id]
    if @program.update(program_params)
      redirect_to admin_program_path
    else
      render :edit
    end
  end

  def destroy
    @program = Program.friendly.find(params[:id])
    @program.destroy
    redirect_to admin_programs_path, alert:'Program deleted'
  end


private

def program_params
  params.require(:program).permit(:title, :description, :space, :price, :image, :pcategory_name, :pcategory_id)
end

end
