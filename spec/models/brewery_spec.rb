require 'rails_helper'
require 'json'

RSpec.describe Brewery, type: :model do
  context 'when using file caching' do
    context 'when .get_json is called' do
      it 'returns brewery info when valid data' do
        # the string entered as an arg is programmed input and can be hardcoded
        data = Brewery.new('trophy')

        allow(data).to receive(:get_json).and_return(File.read("cache/brewery/Trophy.json"))

        trophy = data.get_json

        expect(trophy['data']['name']).to eq 'Trophy Brewing Company'
      end
      it 'returns nil when invalid data' do
        # the string entered as an arg is programmed input and can be hardcoded
        data = Brewery.new('duck_rabbit')

        allow(data).to receive(:get_json).and_return(File.read('cache/brewery/duck_rabbit.json'))

        duck_rabbit = data.get_json

        expect(duck_rabbit['data']['name']).to eq nil
      end
    end
  end
  # context 'when using redis caching' do
  #   context 'when .get_json is called' do
  #     it 'returns brewery info when valid data' do
  #       # the string entered as an arg is programmed input and can be hardcoded
  #       data = Brewery.new('trophy')
  #
  #       allow(data).to receive(:get_json).and_return(Redis.current.get('trophy'))
  #
  #       trophy = data.get_json
  #
  #       expect(Redis.current.get('trophy'['data']['name'])).to eq 'Trophy Brewing Company'
  #     end
  #     it 'returns nil when invalid data' do
  #       # the string entered as an arg is programmed input and can be hardcoded
  #       data = Brewery.new('duck_rabbit')
  #
  #       allow(data).to receive(:get_json).and_return(Redis.current.get('duck_rabbit'))
  #
  #       duck_rabbit = data.get_json
  #
  #       expect(Redis.current.get('duck_rabbit'['data']['name'])).to eq nil
  #     end
  #   end
  # end
end
