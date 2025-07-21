class TestMailer < ApplicationMailer
  def send_mail
    email = "test@example.com"
    mail(to: email, subject: "Your order has been completed")
  end
end
