class Admin::BranchesController < AdminController

  before_action :set_branch, only: [:edit, :update, :destroy]

  def index
    @branches = Branch.all.order(:position).page(params[:page]).per_page(10)
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new(branch_params)
    respond_to do |format|
      if @branch.save
        format.html { redirect_to admin_branches_path, notice: 'Филиал создан.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to admin_branches_path, notice: 'Информация о филиале обновлена.'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @branch.destroy
    redirect_to admin_branches_path, notice: 'Филиал удален.'
  end

  private

  def set_branch
    @branch = Branch.find(params[:id])
  end

  def branch_params
    convert_open_hours
    params.require(:branch).permit(:address, :short_address, :position, :phone, :email, :map, open_hours: [])
  end

  def convert_open_hours
    params[:branch][:open_hours] = params[:branch][:open_hours].split(',').each { |s| s.strip }
  end
end
