class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end  

  def new
    @customer = Customer.new
  end  

  def create
    @customer = Customer.create(customer_params)
    @customer.save

    if @customer.save
      redirect_to root_path
    else  
      render :new
    end  
  end


  private
  def customer_params
    
    params.require(:customer).permit(:name, :post_code_1, :post_code_2, :email, :tel_num, :prefecture, :address_1, :address_2, :address_3, :memo)
  end  
end
