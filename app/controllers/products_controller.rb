class ProductsController < ApplicationController
before_action :set_product , only: [:show, :edit, :update, :destroy]
  
  def index
    @products  = Product.all 
    
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    flash[:notice] = "product was created successfully."    
    redirect_to products_path
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "product was updated"
      redirect_to @product
    end
  end

  def destroy 
    if @product.destroy
     flash[:notice] = "product was delelted"
     redirect_to products_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end


end