require_relative './test_helper'
require_relative '../classes/book'
require 'date'

# Team member 1
RSpec.describe Book do
  context 'Testing Book class' do
    before :each do
      @book1 = Book.new('Title1', Date.parse('2009-07-22'), 'Juan1', 'good')
      @book2 = Book.new('Title2', Date.parse('2021-07-25'), 'Juan2', 'good')
      @book3 = Book.new('Title3', Date.parse('2018-10-06'), 'Juan3', 'bad')
    end

    it 'returns child of Item' do
      expect(@book1).to be_kind_of(Item)
    end

    it 'returns instance of Book' do
      expect(@book1).to be_instance_of(Book)
    end

    it 'returns published date' do
      expect(@book1.publish_date).to eq Date.parse('2009-07-22')
    end

    it 'checks if book can be achived' do
      expect(@book1.can_be_archived?).to eq true
    end

    it 'checks if book can be achived' do
      expect(@book2.can_be_archived?).to eq false
    end

    it 'checks if book can be achived' do
      expect(@book3.can_be_archived?).to eq true
    end
  end
end
