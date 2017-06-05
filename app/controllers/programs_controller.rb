class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def reserve_program
    @program = Program.find(params[:id])
    redirect_to :back
    flash[:notice] = "Program Reserved"
  end
  
end
