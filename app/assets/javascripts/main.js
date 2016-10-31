

// Storing the data:
// localStorage.setItem("variableName","Text");
// Receiving the data:
// localStorage.getItem("variableName");

$(document).ready(function () {
  console.log('ready');

  // beer loading whenever ajax calls are started
  $body = $("body");
  $(document).on({
    ajaxStart: function() { $body.addClass("loading");    },
    ajaxStop: function() { $body.removeClass("loading"); }
  });

  var $newBtn = $('.newBtn');

  var $logout = $('.logout');

  var $pkmnSearch = $('#pkmnSearch');
  var $pkmnSearchBtn = $('.pkmn-search-btn');

  var $brewerySearch = $('#brewerySearch');
  var $brewerySearchBtn = $('.brewery-search-btn');

  function getPokemonInfo(pokemon) {
    $pkmnSearchBtn.attr('disabled', true);
    $.ajax({
      'url': '/pokemon/get?pokemon=' + encodeURIComponent(pokemon), //'/brewery/index',
      'method': 'GET',
      "data": {},
      'dataType': 'json',
      'success': function(pokemonResult) {
        localStorage.setItem('searchedPokemon', pokemon);
        if (pokemonResult === null) {
          setTimeout(function() {
            getPokemonInfo(pokemon);
          }, 3000);
        } else {
          pokemon = JSON.parse(pokemonResult);
          PokemonDetails(pokemon);
          window.location.href = '/brewery/index';
        }
      },
      'error': function(error) {
        console.log('help me computer');
      }
    });
  }

  // pokemon constructor
  function PokemonDetails(pokeSelect) {
    this.info = {
        pokemonName: pokeSelect.name,
        pokemonTP: pokeSelect.weight, // TP is tolerance points
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
    $brewerySearchBtn.attr('disabled', true);
    $.ajax({
      'url': '/brewery/get?brewery=' + encodeURIComponent(brewery),//'/brewery/get?utf8=%E2%9C%93&brewery=' + encodeURIComponent(brewery) + '&commit=Submit',
      'method': 'GET',
      'data': {},
      'dataType': 'json',
      'success': function(breweryResult) {
        localStorage.setItem('searchedBrewery', brewery);
        if (breweryResult === null) {
          setTimeout(function() {
            getBeerAttacks(brewery);
          }, 3000);
        } else {
          brewery = JSON.parse(breweryResult);
          BeerDetails(brewery);
          window.location.href = '/game/loadout';
        }
      },
      'error': function(error) {
        alert(error);
        console.log('help me, computer!');
      }
    });
  }

  // setInterval will be used for the AI
  var userCanAttack = true;

  var userPokemon = localStorage.getItem('pokemonName');
  var userPokemonTP = localStorage.getItem('pokemonWeight');

  var userAttackOne = localStorage.getItem('beerAttackOne');
  var userAttackTwo = localStorage.getItem('beerAttackTwo');
  var userAttackThree = localStorage.getItem('beerAttackThree');
  var userAttackFour = localStorage.getItem('beerAttackFour');

  var userDamageOne  = localStorage.getItem('baseDamageOne');
  var userDamageTwo  = localStorage.getItem('baseDamageTwo');
  var userDamageThree  = localStorage.getItem('baseDamageThree');
  var userDamageFour  = localStorage.getItem('baseDamageFour');

  var userCritOne = localStorage.getItem('critDamageOne');
  var userCritTwo = localStorage.getItem('critDamageTwo');
  var userCritThree = localStorage.getItem('critDamageThree');
  var userCritFour = localStorage.getItem('critDamageFour');

  var userCritChanceOne = localStorage.getItem('critChanceOne');
  var userCritChanceTwo = localStorage.getItem('critChanceTwo');
  var userCritChanceThree = localStorage.getItem('critChanceThree');
  var userCritChanceFour = localStorage.getItem('critChanceFour');

  var computerPokemon = {'Pokemon': 'togepi', 'health': 200, 'attack': 25};
// after each attack reset value to localstorage reassign the new value of pokemon weight
//target the html elemtn that contains the weight and change its value to the math here.
// beer1 ibumin subtracted from health
// can change document to be the play screen page
  $(document).on('keyup', function(event) {
    var key = event.keyCode;
    // 37 is left arrow
    if (key === 37 && userCanAttack) {
      if ((Math.random()*50) <= userCritChanceOne) {
        var damage = userCritOne;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      } else {
        var damage = userDamageOne;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      }
      userCanAttack = false;
      setTimeout(function() {
        userCanAttack = true;
      }, 3000);
    } else if (key === 38 && userCanAttack) {
      if ((Math.random()*50) <= userCritChanceTwo) {
        var damage = userCritTwo;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      } else ;{
        var damage = userDamageTwo;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      }
      userCanAttack = false;
      setTimeout(function() {
        userCanAttack = true;
      }, 3000);
    } else if (key === 39 && userCanAttack) {
      if ((Math.random()*50) <= userCritChanceThree) {
        var damage = userCritThree;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      } else ;{
        var damage = userDamageThree;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      }
      userCanAttack = false;
      setTimeout(function() {
        userCanAttack = true;
      }, 3000);
    } else if (key === 40 && userCanAttack) {
      if ((Math.random()*50) <= userCritChanceFour) {
        var damage = userCritFour;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      } else ;{
        var damage = userDamageFour;
        if (computerPokemon.health - damage > 0) {
          computerPokemon.health -= damage;
          console.log(computerPokemon.health);
        } else {
          computerPokemon.heath = 0;
          alert('You win!');
        }
      }
      userCanAttack = false;
      setTimeout(function() {
        userCanAttack = true;
      }, 3000);
    }
  });

  // beer constructor
  function BeerDetails(beerSelect) {
    var firstAttack = beerSelect.attacks[0].first;
    var secondAttack = beerSelect.attacks[0].second;
    var thirdAttack = beerSelect.attacks[0].third;
    var fourthAttack = beerSelect.attacks[0].fourth;
    this.info = {
        breweryName: beerSelect.name,
        beerAttackOne: firstAttack,
        beerAttackTwo: secondAttack,
        beerAttackThree: thirdAttack,
        beerAttackFour: fourthAttack,
    };
    localStorage.setItem('breweryName', beerSelect.name);
    localStorage.setItem('beerAttackOne', beerSelect.attacks[0].first);
    localStorage.setItem('beerAttackTwo', beerSelect.attacks[0].second);
    localStorage.setItem('beerAttackThree', beerSelect.attacks[0].third);
    localStorage.setItem('beerAttackFour', beerSelect.attacks[0].fourth);

    localStorage.setItem('baseDamageOne', beerSelect.attacks[0].first[1][0]);
    localStorage.setItem('baseDamageTwo', beerSelect.attacks[0].second[1][0]);
    localStorage.setItem('baseDamageThree', beerSelect.attacks[0].third[1][0]);
    localStorage.setItem('baseDamageFour', beerSelect.attacks[0].fourth[1][0]);

    localStorage.setItem('critDamageOne', beerSelect.attacks[0].first[1][1]);
    localStorage.setItem('critDamageTwo', beerSelect.attacks[0].second[1][1]);
    localStorage.setItem('critDamageThree', beerSelect.attacks[0].third[1][1]);
    localStorage.setItem('critDamageFour', beerSelect.attacks[0].fourth[1][1]);

    localStorage.setItem('critChanceOne', beerSelect.attacks[0].first[1][2]);
    localStorage.setItem('critChanceTwo', beerSelect.attacks[0].second[1][2]);
    localStorage.setItem('critChanceThree', beerSelect.attacks[0].third[1][2]);
    localStorage.setItem('critChanceFour', beerSelect.attacks[0].fourth[1][2]);

    var brewerySelection = $('.breweryName').attr('id', this.info.breweryName);
    var beerNames = $('.beerNames');

    // var brewerySelection = $("<div>").attr('class', this.info.breweryName);
    var breweryName = $("<p>").addClass('').attr("id", 'brewery').html(this.info.breweryName).appendTo(brewerySelection);
    var beerAttackOne = $("<p>").addClass('').attr("id", 'attackOne').html(this.info.beerAttackOne).appendTo(beerNames);
    var beerAttackTwo = $("<p>").addClass('').attr("id", 'attackTwo').html(this.info.beerAttackTwo).appendTo(beerNames);
    var beerAttackThree = $("<p>").addClass('').attr("id", 'attackThree').html(this.info.beerAttackThree).appendTo(beerNames);
    var beerAttackFour = $("<p>").addClass('').attr("id", 'attackFour').html(this.info.beerAttackFour).appendTo(beerNames);
    var storagePokemonName = $("<p>").addClass('').attr('id', 'pokemonName').text(localStorage.getItem('pokemonName')).appendTo(beerNames);
  }

  // $(function() {
  //   var localValue = localStorage.getItem('pokemonName');
  //   console.log(localValue);
  //   if(localValue !== 'null');
  //     console.log('Ready!');
  //     // create a progress bar full and say ready
  // });

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

      return false;
    });
  });

  // $logout.on('click', function(error) {
  //   alert('Are you sure? This will wipe your session.');
  //
  // });

  $(function(){
    $newBtn.click(function(){
      if(confirm('This will wipe your pokemon...')) {
        localStorage.clear();
        return true;
      }
      return false;
    });
  });

  $(function(){
    $logout.click(function(){
      if(confirm('Logging out will wipe your Pokemon picks...')) {
        localStorage.clear();
        return true;
      }
      return false;
    });
  });

  $brewerySearchBtn.on('click', function() {

    var brewery = $brewerySearch.val();
    getBeerAttacks(brewery);
    // window.location.href = '/game/loadout'
    return false;
    // window.location.href = '/brewery/get?brewery=' + encodeURIComponent(brewery);
  });





  $( function() {
      var availableTags = [
      'Lonerider',
      'Raleigh',
      'Surly',
      'Gizmo Brew Works',
      'Bull City Burger',
      'Trophy',
      'Fullsteam',
      'Deep River',
      'Hi-Wire',
      'Palmetto',
      'Big Boss',
      'Mother Earth',
      'Bond Brothers',
      'The Duck-Rabbit Craft',
      'Anderson Valley',
      'Cisco Brewers',
      'Westbrook',
      'DuClaw',
      'Jailbreak',
      'New Belgium',
      'Cigar City'
    ];
    $brewerySearch.autocomplete({
      source: availableTags
    });
  } );

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
        'nidoran-f',
        'nidoran-m',
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
