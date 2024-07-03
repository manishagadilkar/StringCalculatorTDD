# frozen_string_literal: true

require './string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end
