class ReservedProgramsController < ApplicationController
  before_actioin :authenticate_user!

  def destroy
    @reservation = current_reservation
    @reserved_program = @reservation.reserved_programs.find_by(program_id: params[:id])
    @program = @reserved_program.program
    @reserved_program.destroy

    flash[:warning] = "Successfully remove #{@program.title} from reservation"
    redirect_to :back
  end
end
