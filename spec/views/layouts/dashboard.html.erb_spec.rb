# frozen_string_literal: true

require 'rails_helper'

describe 'layouts/dashboard' do
  let(:user) { create(:user) }

  before { sign_in user }

  it 'displays left sidebar' do
    render
    expect(rendered).to include('Home', dashboard_root_path)
    expect(rendered).to include('Account', edit_user_registration_path)
  end

  it 'displays link paths' do
    render
    expect(rendered).to include('Logout', destroy_user_session_path)
    expect(rendered).to include('Edit Profile', edit_user_registration_path)
  end
end
