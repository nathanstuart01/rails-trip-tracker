class NewsletterMailer < ApplicationMailer

  def monthly(args)
    mail subject: args[:subject], to: args[:emails]
  end
end
