# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: 'test@example.com'

  def send_contact_email(contact)
    @contact = contact
    mail(to: ENV['TEST_EMAIL'], subject: "You have new contact from #{@contact.email}")
  end
end
