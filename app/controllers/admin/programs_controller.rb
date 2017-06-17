class Admin::ProgramsController < ApplicationController
layout "admin"

before_action :authenticate_user!
before_action :admin_required

  def index
    if params[:category].blank?
      @programs = Program.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @programs = Programs.where(:category_id => @category_id)
    end
  end

  def new
    @program = Program.new
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def create
    @program = Program.new(program_params)
     @program.category_id = params[:category_id]
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
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def update
    @program = Program.friendly.find(params[:id])
      @program.category_id = params[:category_id]
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
  params.require(:program).permit(:title, :description, :space, :price, :image, :category_id, :pcategory_name, :pcategory_id)
end

end
