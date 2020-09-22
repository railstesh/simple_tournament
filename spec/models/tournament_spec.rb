require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'enum' do
    it do
      is_expected.to define_enum_for(:status)
        .with_values(%i[upcoming running finished])
    end
  end
end
