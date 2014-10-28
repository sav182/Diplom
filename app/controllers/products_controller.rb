class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @query = params[:q].to_s
    if @query.to_s != ''
      str = "%" + @query + "%"
      @products = Product.full.where(["products.name LIKE ? OR products.drawing LIKE ? OR products.inventory_number LIKE ? OR products.amount_sections LIKE ?", str,str,str,str])
      .page(params[:page]).per(12)
    else
      @products = Product.full.page(params[:page]).per(12)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product=Product.full.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Изделие успешно создано.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Изделие успешно обновлено.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Изделие успешно удалено.' }
      @product = Product.find(params[:id])
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :drawing, :inventory_number, :amount_sections)
    end
end
