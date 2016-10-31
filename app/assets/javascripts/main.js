console.log('hi mom');



$(document).ready(function () {
  console.log('ready');

  // beer loading whenever ajax calls are started
  $body = $("body");
  $(document).on({
    ajaxStart: function() { $body.addClass("loading");    },
    ajaxStop: function() { $body.removeClass("loading"); }
  });

  var $pkmnSearch = $('#pkmnSearch');
  var $pkmnSearchBtn = $('.pkmn-search-btn');

  var $brewerySearch = $('#brewerySearch');
  var $brewerySearchBtn = $('.brewery-search-btn');

  function getPokemonInfo(pokemon) {
    $.ajax({
      'url': '/pokemon/get?pokemon=' + encodeURIComponent(pokemon), //'/brewery/index',
      'method': 'GET',
      "data": {},
      'dataType': 'json',
      'success': function(pokemon) {
        $pkmnSearchBtn.attr('disabled', true);

        if (pokemon === null) {
          setTimeout(function(pokemon) {

            $pkmnSearchBtn.attr('disabled', false);

            // $pkmnSearchBtn.trigger('click');

          }, 1000);
        } else {
          pokemon = JSON.parse(pokemon);
          PokemonDetails(pokemon);
        }
      },
      'error': function(error) {
        alert(error);
        console.log('help me, computer!');
      }
    });
  }

  // pokemon constructor
  function PokemonDetails(pokeSelect) {
    this.info = {
        pokemonName: pokeSelect.name,
        pokemonWeight: pokeSelect.weight,
        pokemonType: pokeSelect.type.type.name,
        pokemonAttacks: pokeSelect.attacks,
        // pokemonAttackTwo: asdf, //this needs to be the beer
        // pokemonAttackThree: asdf,
        // pokemonAttackFour: asdf
    };
    localStorage.setItem('pokemonName', pokeSelect.name);
    localStorage.setItem('pokemonWeight', pokeSelect.weight);
    localStorage.setItem('pokemonType', pokeSelect.type.type.name);
    localStorage.setItem('pokemonAttacks', pokeSelect.attacks);

    var pokemonSelection = $("<div>").attr('class', this.info.pokemonName);
    var pokemonName = $("<p>").addClass('selectedPokemon').attr("id", this.info.pokemonName).html(this.info.pokemonName).appendTo(pokemonSelection);

    $(pokemonSelection).insertAfter(".main-body");
  }

  // setTimeout(function(pokemon) {
  //   location.reload();
  //   getPokemonInfo(pokemon);
  // }, 3000),

  function getBeerAttacks(brewery) {
    $.ajax({
      'url': '/brewery/get?brewery=' + encodeURIComponent(brewery),//'/brewery/get?utf8=%E2%9C%93&brewery=' + encodeURIComponent(brewery) + '&commit=Submit',
      'method': 'GET',
      'data': {},
      'dataType': 'json',
      'success': function(brewery) {
        $pkmnSearchBtn.attr('disabled', true);

        if (pokemon === null) {
          setTimeout(function(pokemon) {

            $pkmnSearchBtn.attr('disabled', false);

            // $pkmnSearchBtn.trigger('click');

          }, 1000);
        } else {
          brewery = JSON.parse(brewery);
          BeerDetails(brewery);
        }
        //make brewery API call here and assign the attacks to the beers. then spit out the full object.  YAY!!!!
        // need to do something with pokemon.
        // $brewerySearchBtn.attr('disabled', true);
      },
      'error': function(error) {
        alert(error);
        console.log('help me, computer!');
      }
    });
  }

  // Storing the data:
  // localStorage.setItem("variableName","Text");
  // Receiving the data:
  // localStorage.getItem("variableName");

  // beer constructor
  function BeerDetails(beerSelect) {
    this.info = {
        breweryName: beerSelect.name,
        beerAttackOne: beerSelect.attacks[0].first,
        beerAttackTwo: beerSelect.attacks[0].second,
        beerAttackThree: beerSelect.attacks[0].third,
        beerAttackFour: beerSelect.attacks[0].fourth,
    };
    localStorage.setItem('breweryName', beerSelect.name);
    localStorage.setItem('beerAttackOne', beerSelect.attacks[0].first);
    localStorage.setItem('beerAttackTwo', beerSelect.attacks[0].second);
    localStorage.setItem('beerAttackThree', beerSelect.attacks[0].third);
    localStorage.setItem('beerAttackFour', beerSelect.attacks[0].fourth);

    var brewerySelection = $("<div>").attr('class', this.info.breweryName);
    var breweryName = $("<p>").addClass('selectedBrewery').attr("id", 'brewery').html(this.info.breweryName).appendTo(brewerySelection);
    var beerAttackOne = $("<p>").addClass('').attr("id", 'attackOne').html(this.info.beerAttackOne).appendTo(brewerySelection);
    var beerAttackTwo = $("<p>").addClass('').attr("id", 'attackTwo').html(this.info.beerAttackTwo).appendTo(brewerySelection);
    var beerAttackThree = $("<p>").addClass('').attr("id", 'attackThree').html(this.info.beerAttackThree).appendTo(brewerySelection);
    var beerAttackFour = $("<p>").addClass('').attr("id", 'attackFour').html(this.info.beerAttackFour).appendTo(brewerySelection);

    $(brewerySelection).insertAfter(".main-body");
  }

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
      // $pkmnSearchBtn.attr('disabled', true);
      var pokemon = $pkmnSearch.val();
      // window.location.href = '/pokemon/get?pokemon=' + encodeURIComponent(pokemon);
      // maybe add a delay here or some ajax polling - whatever that is.

      getPokemonInfo(pokemon);
      window.location.href = '/brewery/index'
      return false;
    });
  });


  $brewerySearchBtn.on('click', function() {

    var brewery = $brewerySearch.val();
    getBeerAttacks(brewery);
    return false;
    // window.location.href = '/brewery/get?brewery=' + encodeURIComponent(brewery);
  });

});




// (function poll(pokemon) {
//   setTimeout(function() {
//     $.ajax({
//       'url': '/pokemon/get?pokemon=' + encodeURIComponent(pokemon), //'/brewery/index',
//       'method': 'GET',
//       'success': function(pokemon) {
//         $pkmnSearchBtn.attr('disabled', true);
//         JSON.parse(pokemon);
//         console.log(pokemon.attacks[0]);
//       },
//       'dataType': 'json',
//       'complete': poll,
//       'timeout': 2000
//     });
//   }, 5000);
// })();
