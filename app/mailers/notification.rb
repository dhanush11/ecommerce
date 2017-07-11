class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_confirmation.subject
  #
  def order_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end

   def order_confirmation(order)
    @order = order

    mail to: "#{order.user.email}", subject: "Your order has been confirmed - #{order.order_number}"
  end
end
