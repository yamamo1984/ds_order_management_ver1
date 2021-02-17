class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end  

  def new
    @customer = Customer.new
  end  
  
  def create
    @customer = Customer.create(customer_params)
    if @customer.save
       redirect_to customer_path(@customer)
    else  
      render :new
    end   
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
     if customer.save
       redirect_to customers_path
    else  
      render :edit
    end   
  end  

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
  end  
  

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :company, :email, :tel, :post_code, :city, :street_num, :building, :memo, :place_id)
  end
end
