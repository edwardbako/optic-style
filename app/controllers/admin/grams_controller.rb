class Admin::GramsController < AdminController
  before_action :set_gram, only: [:show, :edit, :update, :destroy]

  # GET /admin/grams
  # GET /admin/grams.json
  def index
    @grams = Gram.all.order(created_at: :desc).page(params[:page]).per_page(3)
  end

  # GET /admin/grams/1
  # GET /admin/grams/1.json
  def show
  end

  # GET /admin/grams/new
  def new
    @gram = Gram.create
  end

  # GET /admin/grams/1/edit
  def edit
  end

  # POST /admin/grams
  # POST /admin/grams.json
  def create
    @gram = Gram.new(gram_params)

    respond_to do |format|
      if @gram.save
        format.html { redirect_to admin_grams_path,
                                  notice: 'Gram создан.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/grams/1
  # PATCH/PUT /admin/grams/1.json
  def update
    respond_to do |format|
      if @gram.update(gram_params)
        format.html { redirect_to admin_grams_path,
                                  notice: 'Gram сохранен.' }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/grams/1
  # DELETE /admin/grams/1.json
  def destroy
    @gram.destroy
    respond_to do |format|
      format.html { redirect_to admin_grams_url, notice: 'Gram удален.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gram
    @gram = Gram.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gram_params
    params.require(:gram).permit(:image, :body, :published, :user_id)
  end
end
