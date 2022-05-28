# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/treatments/index' do
  let(:user) { create(:user) }
  let(:treatment) { create(:treatment, user: user) }

  before do
    assign(:treatments, [treatment])
  end

  context 'with dynamic content' do
    it 'display treatments' do
      render

      expect(rendered).to include(treatment.full_name, treatment.diagnosis, treatment.date_of_visit.to_s)
    end
  end
end
