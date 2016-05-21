class MarketingMailer < ApplicationMailer
  helper :mailer
  def send_email(customer)
    @customer = customer
    mail(to: @customer.email, subject: "Your Fortune awaits!!!" )
  end
end
