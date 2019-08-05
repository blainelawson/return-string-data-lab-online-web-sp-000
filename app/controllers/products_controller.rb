class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def create
        Product.create(name: params[:name], description: params[:description]) 
        
        redirect_to products_path
    end

    def description
        product = Product.find_by(id: params[:id])

        render plain: product.description
    end

    def inventory
        product = Product.find_by(id: params[:id])

        if product.inventory > 0 
            render plain: "true" 
        else
            render plain: "false"
        end
    end
end
