# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: 'test@example.com'

  def send_contact_email(contact)
    @contact = contact
    mail(to: 'nikola_nino@outlook.com', subject: "You have new contact from #{@contact.email}")
  end
end
