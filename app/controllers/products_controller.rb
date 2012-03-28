class ProductsController < ApplicationController
  before_filter :find_or_build_product, :except => :index

  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @product.save
      redirect_to @product, :notice => 'Product successfully created'
    else
      render :new
    end
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to @product, :notice => 'Product successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to :products
  end

private
  def find_or_build_product
    @product = params[:id] ? Product.find(params[:id]) : Product.new(params[:product])
  end
end

