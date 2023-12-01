class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @products = Product.find(params[:id])
  end
  def new
      @products = Product.new
  end
  def create
        @products = Product.new(product_params)
        if @products.save
          redirect_to products_path, notice: 'Tu producto se ha creado Correctamente'
        else
          render :new, status: :unprocessable_entity
        end
  end
   private
   def product_params
     params.require(:product).permit(:title,:description,:price)
   end
end
