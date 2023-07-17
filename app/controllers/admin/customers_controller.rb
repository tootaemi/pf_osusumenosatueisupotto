class Admin::CustomersController < ApplicationController
  
    def index
      @customers = Customer.all
      @customer = Customer.new
      # @customer = Customer.all.order("created_at DESC")
      @customers = Customer.all.page(params[:page]).per(10)
    end

    def show
      @customer = Customer.find(params[:id])
    end
    
    def edit
      @customer = Customer.find(params[:id])
      @customer = Customer.find(1)
    end
    
    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to admin_customer_path
      else
        render :admin_customer_path
      end
    end
    
    def destroy
      Customer.find(params[:id]).destroy
        redirect_to admin_customers_path
    end
    
    private
      def customer_params
        params.require(:customer).permit(:id, :name, :email, :encrypted_password)
      end
end