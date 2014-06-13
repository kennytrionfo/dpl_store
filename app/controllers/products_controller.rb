class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  # The index action
  # This should list all of our products
  # index.html.erb

  def index
    @products = Product.all
  end


  #This should find a particular prodcut
  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:notice] = 'Good job! You did it.'
      redirect_to products_path
    else
      #saving to the db field
      #do something else
      flash[:alert] = 'Bad job! You failed.'
      render :new
    end
  end

  def edit
  end


  def update
    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end


  private
  #define a provate method
  #use strong parameters
  def product_params
    params.require(:product).permit(:name)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
