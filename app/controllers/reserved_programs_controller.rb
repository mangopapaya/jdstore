class ReservedProgramsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @reservation = current_reservation
    @reserved_program = @reservation.reserved_programs.find_by(program_id: params[:id])
    @program = @reserved_program.program
    @reserved_program.destroy

    flash[:warning] = "Successfully remove #{@program.title} from reservation"
    redirect_to :back
  end

  def update
    @reservation = current_reservation
    @reserved_program = @reservation.reserved_programs.find_by(program_id: params[:id])
    @reserved_program.update (reserved_program_params)
    redirect_to reservations_path
  end

  private

  def reserved_program_params
    params.require(:reserved_program).permit(:slot)
  end
end
