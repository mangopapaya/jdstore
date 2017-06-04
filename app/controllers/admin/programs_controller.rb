class Admin::ProgramsController < ApplicationController
layout "admin"

before_action :authenticate_user!
before_action :admin_required

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to admin_programs_path
    else
      render :new
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(program_params)
      redirect_to admin_programs_path
    else
      render :edit
    end
  end


private

def program_params
  params.require(:program).permit(:title, :category, :description, :space, :price, :image)
end

end
