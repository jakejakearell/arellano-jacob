# require './spec/spec-helper'
require './lib/transform_list'

RSpec.describe TransformList do
  before :each do
    old_list = File.open("./files/mixed_list.txt")
    args = ['gender', 'lastname']
    @transform_list = TransformList.new(old_list, args)
  end
  describe 'instance methods' do
    describe '#transform_list'do
      xit 'can transform list' do

        new_list = File.open("./files/test1.txt").read
        expected_outcome = File.open("./files/output_1.txt").read

        expect(new_list).to eq(expected_outcome)
      end
    end

    describe '#transform_list' do
      it 'can transform the new list' do
        thing = @transform_list.transform_list
        require "pry"; binding.pry
      end
    end

    describe '#transform_line' do
      it 'can check transform a line type' do

      end
    end

    describe '#sort' do
      it 'sort based on two inputs' do

      end
    end
  end
end
