require_relative '../lib/google_search_results.rb'

describe "GoogleSearchResults" do
  describe 'Parsed Successfully' do
    before(:all) do
      @result = GoogleSearchResults.new(query: 'Van Gogh Paintings').result
    end

    it 'should match paintings count' do
      expect(@result.length).to be(51)
    end

    it 'should' do
      first_painting = @result.first

      expect(first_painting[:name]).to eq('The Starry Night')
      expect(first_painting[:extension]).to eq('1889')
      expect(first_painting[:link]).to eq('https://www.google.com/search?gl=us&hl=en&q=The+Starry+Night&stick=H4sIAAAAAAAAAONgFuLQz9U3MI_PNVLiBLFMzC3jC7WUspOt9Msyi0sTc-ITi0qQmJnFJVbl-UXZxY8YI7kFXv64JywVMGnNyWuMXlxEaBJS4WJzzSvJLKkUkuLikYLbrcEgxcUF5_EsYhUIyUhVCC5JLCqqVPDLTM8oAQDmNFnDqgAAAA&npsic=0&sa=X&ved=0ahUKEwiL2_Hon4_hAhXNZt4KHTOAACwQ-BYILw')
      expect(first_painting[:thumbnail]).to eq('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq3gOqqnprlNb3SdEgrKAR_0sWrsu0kO0aNnwE3yRwmA_cf-PvBvdz4eInim3FDmRn7E0')
    end
  end

  describe 'Parsed Unsuccessfully' do
    before(:all) do
      @result = GoogleSearchResults.new(query: 'Van Gogh').result
    end

    it 'should match paintings count' do
      expect(@result.length).to be(0)
    end
  end
end
