class Admin::Branches::ViewsController < AdminController

  before_action :set_branch
  before_action :set_view, only: [:update, :destroy]

  def index
    @views = @branch.views.uploaded.order(created_at: :desc)
  end

  def create
    @view = @branch.views.create(view_params)
    respond_to do |format|
      if @view.save!
        format.html { redirect_to admin_branch_views_path(@branch),
                                  notice: 'Изображение загружено' }
        format.js
      else
        format.html { render :index }
        format.js { render text: "alert('Tro-lo-lo');" }
      end
    end
  end

  def update

  end

  def destroy
    @view.destroy
    respond_to do |format|
      format.html { redirect_to admin_branch_views_path(@branch), notice: 'Изображение удалено' }
    end
  end

  private

  def set_branch
    @branch = Branch.find(params[:branch_id])
  end

  def set_view
    @view = @branch.views.find(params[:id])
  end

  def view_params
    params.require(:branch_view).permit(:image, :description, :position)
  end
end