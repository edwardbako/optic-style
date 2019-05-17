class Admin::Clients::RecipesController < AdminController
  before_action :set_client
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /admin/clients/recipes
  # GET /admin/clients/recipes.json
  def index
    @recipes = @client.recipes
  end

  # GET /admin/clients/recipes/1
  # GET /admin/clients/recipes/1.json
  def show
  end

  # GET /admin/clients/recipes/new
  def new
    @recipe = @client.recipes.new
  end

  # GET /admin/clients/recipes/1/edit
  def edit
  end

  # POST /admin/clients/recipes
  # POST /admin/clients/recipes.json
  def create
    @recipe = @client.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to admin_client_path(@client), notice: 'Рецепт создан.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clients/recipes/1
  # PATCH/PUT /admin/clients/recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to admin_client_path(@client), notice: 'Рецепт сохранен.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clients/recipes/1
  # DELETE /admin/clients/recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_client_path(@client, recipes_page: params[:recipes_page]),
                                notice: 'Рецепт удален.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:date, :od_sph, :od_cyl, :od_ax, :os_sph, :os_cyl, :os_ax, :dp, :comment, :client_id)
    end
end
