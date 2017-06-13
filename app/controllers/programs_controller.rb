class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
      @program = Program.find(params[:id])
  end

  def reserve_program
    @program = Program.find(params[:id])
    if !current_reservation.programs.include?(@program)
      current_reservation.reserve_program(@program)
      flash[:notice] = "#{@program.title} Program Reserved!"
    else
      flash[:warning] = "Program already reserved."
    end
    redirect_to :back
  end

end
