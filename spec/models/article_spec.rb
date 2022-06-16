# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:article) { create(:article, user: user) }

  let(:user) { create :user }

  describe 'validations' do
    it { expect(article).to be_valid }
    it { expect(article).to validate_presence_of(:title) }
    it { expect(article).to validate_presence_of(:content) }
  end
end
