require 'rspec'
require_relative '../person'
require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../trim_decorator'

describe Person do
	before :each do
	  @person = Person.new('Seko', 27)
	end
	it 'initializes the person correctly' do
	  expect(@person.name).to eq 'Seko'
	  expect(@person.age).to eq 27
	  expect(@person.parent_permission).to eq true
	end
	it 'can use service' do
	  expect(@person.can_use_services?).to eq true
	end
	it 'returns correct name' do
	  expect(@person.correct_name).to eq 'Seko'
	end
  end
  describe do
	before :each do
	  @person = Person.new('Seko', 25)
	  @base_decorator = BaseDecorator.new(@person)
	  @capital_decorator = CapitalizeDecorator.new(@person)
	  @trimmer_decorator = TrimmerDecorator.new(@person)
	end
	it 'Test #correct_name for BaseDecorator' do
	  expect(@base_decorator.correct_name).to eq 'Seko'
	end
	it 'is inherited' do
	  expect(CapitalizeDecorator < BaseDecorator).to eq true
	  expect(@capital_decorator.correct_name).to eq 'Seko'
	end
	it 'is not inherited' do
	  expect(TrimmerDecorator < BaseDecorator).to eq true
	  expect(@trimmer_decorator.correct_name).to eq 'Seko'
	end
  end
    