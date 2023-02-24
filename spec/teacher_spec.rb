require 'rspec'
require_relative '../teacher'

describe Teacher do
  context 'Teacher class should return the correct parameters that are passed in' do
    let(:teacher) { Teacher.new('Maths', 25, 'Cindy') }

    it 'Must return the Maths as a specialization' do
      expect(teacher.specialization).to eq('Maths')
    end

    it '#can_use_services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
