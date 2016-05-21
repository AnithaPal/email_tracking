class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    default_url_options[:host] = "localhost:3000"
    @customer = Customer.new
  end
  #
  # def edit
  # end

  def create
    default_url_options[:host] = "localhost:3000"
    @customer = Customer.new(customer_params)

    if @customer.save
      MarketingMailer.send_email(@customer).deliver_now
      redirect_to customers_path
    else
      redirect_to :back
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
