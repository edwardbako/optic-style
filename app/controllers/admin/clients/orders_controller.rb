class Admin::Clients::OrdersController < AdminController
  before_action :set_client
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /admin/clients/orders
  # GET /admin/clients/orders.json
  def index
    @orders = @client.orders
  end

  # GET /admin/clients/orders/1
  # GET /admin/clients/orders/1.json
  def show
  end

  # GET /admin/clients/orders/new
  def new
    @order = @client.orders.new
  end

  # GET /admin/clients/orders/1/edit
  def edit
  end

  # POST /admin/clients/orders
  # POST /admin/clients/orders.json
  def create
    @order = @client.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to admin_client_path(@client), notice: 'Заказ создан.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clients/orders/1
  # PATCH/PUT /admin/clients/orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_client_path(@client), notice: 'Заказ сохренен.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clients/orders/1
  # DELETE /admin/clients/orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_client_path(@client, orders_page: params[:orders_page]),
                                notice: 'Заказ удален.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :client_id, :number, :date, :frame, :lenses, :sum, :comment)
    end
end
