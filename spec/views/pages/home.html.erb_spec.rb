# frozen_string_literal: true

require 'spec_helper'

describe 'pages/home' do
  it 'renders home page' do
    render

    expect(rendered).to include('Learn More', 'Request appointment', 'Smile Solutions', "What's our customers say")
  end
end
