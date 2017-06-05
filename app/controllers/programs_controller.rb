class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def reserve_program
    @program = Program.find(params[:id])
    current_reservation.reserve_program(@program)
    flash[:notice] = "Program Reserved!"
    redirect_to :back
  end

end
