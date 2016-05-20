class CustomersController < ApplicationController
  # def index
  #   @customers = Customer.all
  # end
  #
  # def show
  #   @customer = Customer.find(params[:id])
  # end
  #
  def new
    @customer = Customer.new
  end
  #
  # def edit
  # end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      MarketingMailer.send_email(@customer).deliver
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
