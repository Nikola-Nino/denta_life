# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
  describe 'notify' do
    let(:contact) { create :contact }
    let(:mail) { described_class.send_contact_email(contact) }

    it 'renders the subject' do
      expect(mail.subject).to eq("You have new contact from #{contact.email}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['nikola_nino@outlook.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['test@example.com'])
    end
  end
end
