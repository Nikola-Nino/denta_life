# frozen_string_literal: true

require 'rails_helper'

describe 'layouts/navbar' do
  it 'renders the navbar' do
    render partial: 'layouts/navbar'

    expect(rendered).to include('What we do', 'Contact', 'Articles')
  end
end
