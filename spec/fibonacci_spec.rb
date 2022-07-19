require './fibonacci'
describe 'Fibonacci' do
  before(:example, :random) { @test_int = rand(999) }

  describe '.generate' do
    context 'given a valid integer' do
      it 'returns the fibonacci sequence to that many digits' do
        expect(Fibonacci.generate(10)).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
      end
    end
    context 'can handle integers less than 2' do
      it 'returns [0]' do
        expect(Fibonacci.generate(-10)).to eq([0])
      end
    end
  end
  describe '.generate_recursively' do
    context 'given a valid integer' do
      it 'returns the fibonacci sequence to that many digits' do
        expect(Fibonacci.generate_recursively(10)).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
      end
    end
    context 'can handle integers less than 2' do
      it 'returns [0]' do
        expect(Fibonacci.generate_recursively(-10)).to eq([0])
      end
    end
    context 'given a large random integer', :random do
      it 'returns the fibonacci sequence to that many digits' do
        expect(Fibonacci.generate_recursively(@test_int)).to eq(Fibonacci.generate(@test_int))
      end
    end
  end
end
