require_relative './test_helper'
require_relative '../classes/label'

# Team member 1
RSpec.describe Label do
  context 'Testing Label class' do
    before :each do
      @label = Label.new('Title1', 'Red')
      @item = Item.new('Title1', '2020-03-12')
    end

    it 'returns instance of Label' do
      expect(@label).to be_instance_of(Label)
    end

    it 'returns title on label' do
      expect(@label.title).to eq 'Title1'
    end

    it 'returns color on label' do
      expect(@label.color).to eq 'Red'
    end

    it 'checks if label contains items' do
      @label.add_item(@item)
      expect(@label.items).to include(@item)
    end
  end
end
