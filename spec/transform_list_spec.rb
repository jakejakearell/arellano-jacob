# require './spec/spec-helper'
require './lib/transform_list'

RSpec.describe TransformList do
  it 'has a name' do
    old_list = File.open("./files/mixed_list.txt")
    new_list = TransformList.new(old_list)
    expected_outcome = File.open("./files/output_1.txt").read

    expect(new_list).to eq(expected_outcome)
  end
end
