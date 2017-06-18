class ProgramsController < ApplicationController
  def index
    if params[:category].blank?
      @programs = Program.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @programs = Program.where(:category_id => @category_id)
    end
  end

  def show
      @program = Program.friendly.find(params[:id])
  end

  def reserve_program
    @program = Program.friendly.find(params[:id])
    if !current_reservation.programs.include?(@program)
      current_reservation.reserve_program(@program)
      flash[:notice] = "#{@program.title} Program Reserved!"
    else
      flash[:warning] = "Program already reserved."
    end
    redirect_to :back
  end

  def programs_category
    category = Category.find(params[:id])
    category.programs
  end

end
