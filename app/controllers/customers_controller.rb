class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @opened_emails = SentOpenedEmail.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customers = Customer.all
    default_url_options[:host] = "email-tracker1.herokuapp.com"
    @customer = Customer.new
  end

  def create
    # default_url_options[:host] = "email-tracker1.herokuapp.com"
    @customer = Customer.new(customer_params)

    if @customer.save
      MarketingMailer.send_email(@customer).deliver_now
      flash[:notice] = "Email has sent successfully"
      redirect_to customers_path
    else
      flash[:error] = "Sorry, There was some an error sending an email. Please try again."
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
