require_relative './test_helper'

# Team member 1
RSpec.describe Label do
  it 'should be an instance of Label' do
    label = create_label

    expect(label).to be_an_instance_of(Label)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Label.new }.to raise_error(ArgumentError)
  end
end
