# frozen_string_literal: true

require 'rails_helper'

describe 'layouts/navbar' do
  it 'renders the navbar' do
    render partial: 'layouts/navbar'

    expect(rendered).to include('What we do', about_path, 'Contact', contact_path, 'Articles', articles_path)
  end
end
