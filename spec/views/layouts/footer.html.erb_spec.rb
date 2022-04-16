# frozen_string_literal: true

require 'rails_helper'

describe 'layouts/footer' do
  it 'displays footer icons' do
    render partial: 'layouts/footer'

    expect(rendered).to include('https://www.twitter.com/')
    expect(rendered).to include('https://www.instagram.com/')
    expect(rendered).to include('https://www.facebook.com/')
  end

  it 'displays phone, email and address name' do
    render partial: 'layouts/footer'

    expect(rendered).to include('Contacts', 'Email', 'Address', 'Phone')
    expect(rendered).to include('850-123-5021', 'info@dentalife.com', '312 Lovely Street, NY')
  end
end
