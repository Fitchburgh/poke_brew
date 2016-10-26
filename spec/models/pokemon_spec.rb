require 'rails_helper'
require 'json'
#
RSpec.describe Pokemon, type: :model do
  # describe Pokemon do
    # context 'when .get_json called on valid data' do
    #   it 'returns pokemon info' do
    #     data = Pokemon.new('bulbasaur')
    #
    #
    #     allow(data).to receive(:get_json).and_return(File.read("cache/pokemon/bulbasaur.json"))
    #
    #     pokemon_list = data.get_json
    #
    #     expect(pokemon_list).to eq(File.read("cache/pokemon/#{@user_input}.json"))
    #   end
      #
      # it 'returns 151 when #length is called on pokemon_entries' do
      #   data = Pokemon.new('kanto')
      #
      #   allow(data).to receive(:get_json).and_return(JSON.parse(File.read('cache/pokemon/bulbasaur.json')))
      #
      #   pokemon_list = data.get_json
      #   a = pokemon_list["http://pokeapi.co/api/v2/pokedex/kanto"]["pokemon_entries"]
      #
      #   expect(a.length).to eq 151
      # end
    # end
    context 'when .name_check is called on files' do
      it 'returns true if file exists' do
        pkmn = Pokemon.new('bulbasaur')

        expect(pkmn.name_check).to eq true
      end
      it 'returns false if file does not exists' do
        pkmn = Pokemon.new('charmander')

        expect(pkmn.name_check).to eq nil
      end
      context 'after .name_check false return' do
        context '.write_to' do
          it 'writes a new file with name being user input' do
            pkmn = Pokemon.new('charmander')

            allow(pkmn).to receive(:get_json).and_return(JSON.parse(File.read('cache/pokemon/test.json')))

            # pkmn_name_and_id = JSON.parse(JSON.parse(File.read('cache/pokemon/name_id.json')))
            pkmn_name_and_id = { 'name' => 'bulbasaur' }
            result = pkmn.get_json

            expect(result['forms'].first['name']).to eq pkmn.pkmn_name

            expect(pkmn.write_to(pkmn_name_and_id, pkmn)).to eq File.read('cache/pokemon/charmander.json')
            # File.read("cache/pokemon/#{pkmn.pkmn_name}.json")
          end
        end
      end
    end
  # end
end


# context 'when given a pokemon not present in cache .write_to' do
#   it 'appends the pokemon data to a new cache file' do
#     data = Pokemon.new('charmander')
#
#
#
#     # allow(data).to receive(:get_json).and_return(File.read('bulbasaur.json'))
#     pokemon == nil
#
#
#   end
# end
