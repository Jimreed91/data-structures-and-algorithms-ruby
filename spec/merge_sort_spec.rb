require './merge_sort'
describe 'MergeSort' do
  before(:example, :random) do
    @test = Array.new(500) { rand(1..999) }
  end

  describe '.sort' do
    context 'given an even number of unsorted numbers' do
      it 'returns the numbers in ascending order' do
        expect(MergeSort.sort([8, 3, 1, 2, 4, 7, 6, 5])).to eq([1, 2, 3, 4, 5, 6, 7, 8])
      end
    end
    context 'given an odd number of unsorted numbers' do
      it 'returns the numbers in ascending order' do
        expect(MergeSort.sort([8, 3, 1, 2, 1, 4, 7, 6, 5])).to eq([1, 1, 2, 3, 4, 5, 6, 7, 8])
      end
    end
    context 'given a (relatively) large amount of random unsorted numbers', :random do
      it 'returns the numbers in ascending order' do
        expect(MergeSort.sort(@test)).to eq @test.sort
      end
    end
  end
end
