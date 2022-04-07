# frozen_string_literal: true

require 'spec_helper'

describe 'pages/home' do
  it 'display header' do
    render

    expect(rendered).to include('Welcome')
  end
end
