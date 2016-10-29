console.log('hi mom');




$(document).ready(function () {
  console.log('ready');
  var $pkmnSearch = $('#pkmnSearch');
  var $pkmnSearchBtn = $('.pkmn-search-btn');
  var pokemonInfo = '';

  function getPokemonInfo() {
    $.ajax({
      'url': '/pokemon/index',
      'method': 'GET',
      "data": {},
      'dataType': 'json',
      'success': function(pokemonInfo) {
        console.log(pokemonInfo);
      },
      'error': function(error) {
        alert('Please reload the page...I did something dumb.')
      }
    });
  }

  getPokemonInfo();

  $( function() {
      var availableTags = [
        'Abra',
        'Aerodactyl',
        'Alakazam',
        'Arbok',
        'Arcanine',
        'Articuno',
        'Beedrill',
        'Bellsprout',
        'Blastoise',
        'Bulbasaur',
        'Butterfree',
        'Caterpie',
        'Chansey',
        'Charizard',
        'Charmander',
        'Charmeleon',
        'Clefable',
        'Clefairy',
        'Cloyster',
        'Cubone',
        'Dewgong',
        'Diglett',
        'Ditto',
        'Dodrio',
        'Doduo',
        'Dragonair',
        'Dragonite',
        'Dratini',
        'Drowzee',
        'Dugtrio',
        'Eevee',
        'Ekans',
        'Electabuzz',
        'Electrode',
        'Exeggcute',
        'Exeggutor',
        "Farfetch'd",
        'Fearow',
        'Flareon',
        'Gastly',
        'Gengar',
        'Geodude',
        'Gloom',
        'Golbat',
        'Goldeen',
        'Golduck',
        'Golem',
        'Graveler',
        'Grimer',
        'Growlithe',
        'Gyarados',
        'Haunter',
        'Hitmonchan',
        'Hitmonlee',
        'Horsea',
        'Hypno',
        'Ivysaur',
        'Jigglypuff',
        'Jolteon',
        'Jynx',
        'Kabuto',
        'Kabutops',
        'Kadabra',
        'Kakuna',
        'Kangaskhan',
        'Kingler',
        'Koffing',
        'Krabby',
        'Lapras',
        'Lickitung',
        'Machamp',
        'Machoke',
        'Machop',
        'Magikarp',
        'Magmar',
        'Magnemite',
        'Magneton',
        'Mankey',
        'Marowak',
        'Meowth',
        'Metapod',
        'Mew',
        'Mewtwo',
        'Moltres',
        'Mr. Mime',
        'Muk',
        'Nidoking',
        'Nidoqueen',
        'Nidoran♀',
        'Nidoran♂',
        'Nidorina',
        'Nidorino',
        'Ninetales',
        'Oddish',
        'Omanyte',
        'Omastar',
        'Onix',
        'Paras',
        'Parasect',
        'Persian',
        'Pidgeot',
        'Pidgeotto',
        'Pidgey',
        'Pikachu',
        'Pinsir',
        'Poliwag',
        'Poliwhirl',
        'Poliwrath',
        'Ponyta',
        'Porygon',
        'Primeape',
        'Psyduck',
        'Raichu',
        'Rapidash',
        'Raticate',
        'Rattata',
        'Rhydon',
        'Rhyhorn',
        'Sandshrew',
        'Sandslash',
        'Scyther',
        'Seadra',
        'Seaking',
        'Seel',
        'Shellder',
        'Slowbro',
        'Slowpoke',
        'Snorlax',
        'Spearow',
        'Squirtle',
        'Starmie',
        'Staryu',
        'Tangela',
        'Tauros',
        'Tentacool',
        'Tentacruel',
        'Vaporeon',
        'Venomoth',
        'Venonat',
        'Venusaur',
        'Victreebel',
        'Vileplume',
        'Voltorb',
        'Vulpix',
        'Wartortle',
        'Weedle',
        'Weepinbell',
        'Weezing',
        'Wigglytuff',
        'Zapdos',
        'Zubat'
    ];
    $pkmnSearch.autocomplete({
      source: availableTags
    });
  } );

  $pkmnSearch.keyup(function() {
    var pokemon = $pkmnSearch.val();
    console.log(pokemon);
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

    $('.pokemon').show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
    $pkmnSearchBtn.on('click', function() {
      window.location.href = '../brewery/index';
      getPokemonInfo();
      return false;

    });
  });

});
