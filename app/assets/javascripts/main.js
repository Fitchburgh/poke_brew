console.log('hi mom');

$(document).ready(function () {
  console.log('ready');

  var $pkmnSearch = $('#pkmnSearch');
  var $pkmnSearchBtn = $('.pkmn-search-btn');
  var pokemonInfo = '';

  function getPokemonInfo(pokemon) {
    $.ajax({
      'url': '/pokemon/get?pokemon=' + encodeURIComponent(pokemon), //'/brewery/index',
      'method': 'GET',
      "data": {},
      'dataType': 'json',
      'success': function(pokemon) {
        var pokemon = JSON.parse(pokemon)
        //make brewery API call here and assign the attacks to the beers. then spit out the full object.  YAY!!!!
        console.log(pokemon.attacks[0]);

        // need to do something with pokemon.
      },
      'error': function(error) {
        alert(error);
        console.log('help me, computer!');
      }
    });
  }

  function getBeerAttacks() {
    var beerSearch = $('.beerSearch').val("");
    $.ajax({
      'url': '/brewery/select?utf8=%E2%9C%93&brewery=' + encodeURIComponent(beerSearch) + '&commit=Submit',
      'method': 'GET',
      'data': {},
      'dataType': 'json',
      'success': function(brewery) {
        console.log(brewery);
      },
      'error': function(error) {
        alert(error);
        console.log('help me, computer!');
      }
    });
  }


  // here's my attempt at polling...
  // (function poll(pokemon) {
  //   setTimeout(function(pokemon) {
  //     $.ajax({
  //       'url': '/pokemon/submit?pokemon=' + encodeURIComponent(pokemon),
  //       'method': "GET",
  //       'success': function(pokemon) {
  //         JSON.parse(pokemon)
  //       // check if null return (no results from API)
  //         if (pokemon === null) {
  //           console.log('no data!');
  //         } else {
  // prob need to modify this part further
  //           $.each(pokemon, function(index, element) {
  //             arrayName.push([element.whatever1, element.whatever2]);
  //              // cycle through internal array to see if match, or existing coordinates
  //             for (var i = 0; i < arrayName.length; i++) {
  //               // check if new data received matches what is in internal array
  //               if (arrayName[i][0] === element.whatever1 && arrayName[i][1] === element.whatever2) {
  //                 console.log('data received is already in array .. skipping');
  //               } else {
  //                 console.log('new data!');
  //               }
  //               console.log(pokemon.attacks[0]);
  //             }
  //
  //           });
  //         }
  //       },
  //       'dataType': "json",
  //       'complete': poll,
  //       'timeout': 2000
  //     });
  //     }, 3000);
  //   })();

  $( function() {
      var availableTags = [
        'abra',
        'aerodactyl',
        'alakazam',
        'arbok',
        'arcanine',
        'articuno',
        'beedrill',
        'bellsprout',
        'blastoise',
        'bulbasaur',
        'butterfree',
        'caterpie',
        'chansey',
        'charizard',
        'charmander',
        'charmeleon',
        'clefable',
        'clefairy',
        'cloyster',
        'cubone',
        'dewgong',
        'diglett',
        'ditto',
        'dodrio',
        'doduo',
        'dragonair',
        'dragonite',
        'dratini',
        'drowzee',
        'dugtrio',
        'eevee',
        'ekans',
        'electabuzz',
        'electrode',
        'exeggcute',
        'exeggutor',
        "farfetch'd",
        'fearow',
        'flareon',
        'gastly',
        'gengar',
        'geodude',
        'gloom',
        'golbat',
        'goldeen',
        'golduck',
        'golem',
        'graveler',
        'grimer',
        'growlithe',
        'gyarados',
        'haunter',
        'hitmonchan',
        'hitmonlee',
        'horsea',
        'hypno',
        'ivysaur',
        'jigglypuff',
        'jolteon',
        'jynx',
        'kabuto',
        'kabutops',
        'kadabra',
        'kakuna',
        'kangaskhan',
        'kingler',
        'koffing',
        'krabby',
        'lapras',
        'lickitung',
        'machamp',
        'machoke',
        'machop',
        'magikarp',
        'magmar',
        'magnemite',
        'magneton',
        'mankey',
        'marowak',
        'meowth',
        'metapod',
        'mew',
        'mewtwo',
        'moltres',
        'mr-mime',
        'muk',
        'nidoking',
        'nidoqueen',
        'nidoran♀',
        'nidoran♂',
        'nidorina',
        'nidorino',
        'ninetales',
        'oddish',
        'omanyte',
        'omastar',
        'onix',
        'paras',
        'parasect',
        'persian',
        'pidgeot',
        'pidgeotto',
        'pidgey',
        'pikachu',
        'pinsir',
        'poliwag',
        'poliwhirl',
        'poliwrath',
        'ponyta',
        'porygon',
        'primeape',
        'psyduck',
        'raichu',
        'rapidash',
        'raticate',
        'rattata',
        'rhydon',
        'rhyhorn',
        'sandshrew',
        'sandslash',
        'scyther',
        'seadra',
        'seaking',
        'seel',
        'shellder',
        'slowbro',
        'slowpoke',
        'snorlax',
        'spearow',
        'squirtle',
        'starmie',
        'staryu',
        'tangela',
        'tauros',
        'tentacool',
        'tentacruel',
        'vaporeon',
        'venomoth',
        'venonat',
        'venusaur',
        'victreebel',
        'vileplume',
        'voltorb',
        'vulpix',
        'wartortle',
        'weedle',
        'weepinbell',
        'weezing',
        'wigglytuff',
        'zapdos',
        'zubat'
    ];
    $pkmnSearch.autocomplete({
      source: availableTags
    });
  } );

  $pkmnSearch.keyup(function() {
    var pokemon = $pkmnSearch.val();
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

    $('.pokemon').show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
    $pkmnSearchBtn.on('click', function() {
      $pkmnSearchBtn.attr('disabled', true);
      var pokemon = $pkmnSearch.val();
      window.location.href = '/pokemon/get?pokemon=' + encodeURIComponent(pokemon);
      // maybe add a delay here or some ajax polling - whatever that is.

      getPokemonInfo(pokemon);
      return false;
    });
  });

});
