# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'assciations' do
    it { is_expected.to belong_to(:resource).optional(true) }
  end
end
