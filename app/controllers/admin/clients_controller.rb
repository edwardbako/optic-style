class Admin::ClientsController < AdminController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /admin/clients
  # GET /admin/clients.json
  def index
    @clients = Client.all.order(:last_name)
    @clients = @clients.where(branch_id: params[:branch]) if params[:branch].present?
    @clients = @clients.search(params[:search]) if params[:search].present?
    @clients = @clients.page(params[:page]).per_page(12)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /admin/clients/1
  # GET /admin/clients/1.json
  def show
    @orders = @client.orders.order(date: :desc).page(params[:orders_page]).per_page(10)
    @recipes = @client.recipes.order(date: :desc).page(params[:recipes_page]).per_page(10)
    # binding.pry
  end

  # GET /admin/clients/new
  def new
    @client = Client.new
    @client.phones.build
  end

  # GET /admin/clients/1/edit
  def edit
  end

  # POST /admin/clients
  # POST /admin/clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to admin_client_path(@client, search: params[:search], page: params[:page]),
                                  notice: 'Клиент успешно создан.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clients/1
  # PATCH/PUT /admin/clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to admin_client_path(@client, search: params[:search], page: params[:page]),
                                  notice: 'клиент сохранен.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clients/1
  # DELETE /admin/clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to admin_clients_url(search: params[:search], page: params[:page]),
                                notice: 'Клиент удален.' }
      format.json { head :no_content }
    end
  end

  def phone

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :patronymic, :email, :birth_date,
                                     :personal_data_agreement, :email_notification_agreement, :sms_notification_agreement,
                                     :branch_id, :comment,
                                     phones_attributes: [:id, :number, :comment, :_destroy])
    end
end
