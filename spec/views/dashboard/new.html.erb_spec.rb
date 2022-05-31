# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/treatments/new' do
  it 'displays treatment form' do
    assign(:treatment, Treatment.new)

    render partial: 'form'

    expect(rendered).to include('Name', 'Date of visit', 'Diagnosis', 'Treatment', 'Special conditions and additional notes')
  end

  # it 'displays error messages' do
  #   assign(:treatment, Treatment.create(full_name: '', date_of_visit: '', diagnosis: '', treatment: '', special_conditions_and_additional_notes: ''))

  #   render partial: 'form'

  #   expect(rendered).to include('Full name can&#39;t be blank')
  #   expect(rendered).to include('Date of visit can&#39;t be blank')
  #   expect(rendered).to include('Diagnosis can&#39;t be blank')
  #   expect(rendered).to include('Treatment can&#39;t be blank')
  #   expect(rendered).to include('Special conditions and additional notes can&#39;t be blank')
  # end
end
