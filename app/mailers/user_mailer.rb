class UserMailer < ApplicationMailer
  default from: 'noreply@jungle.com'

  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: 'Order Confirmation: ')
  end
end
