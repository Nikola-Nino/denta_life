# frozen_string_literal: true

require 'spec_helper'

describe 'pages/about' do
  it 'renders about page' do
    render

    expect(rendered).to include('We do', 'things differently', 'Our services', 'Our Team')
  end
end
