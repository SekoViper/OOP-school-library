require 'rspec'
require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math_class')
  end

  it 'initialize the class correctly' do
    expect(@classroom.label).to eq 'Math_class'
  end
end
