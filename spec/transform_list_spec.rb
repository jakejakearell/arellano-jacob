require './spec/spec-helper'
require './lib/transform_list'

RSpec.describe TransformList do
  it 'has a name' do
    old_list = File.open("./file/mixed_list", w)
    new_list = TransformList.new(old_list, output_1_args)


    expect(wolf.name).to eq('Nymeria')
  end
end
