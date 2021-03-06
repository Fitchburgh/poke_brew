//NOTE want to add pokeball rolling off the screen when button clicked.

$(document).ready(function () {
  // beer loading whenever ajax calls are started
  $body = $("body");
  $(document).on({
    ajaxStart: function() { $body.addClass("loading");    },
    ajaxStop: function() { $body.removeClass("loading"); }
  });

  var $displayCurrentBtn = $('.display-current-btn');

  var $newBtn = $('.newBtn');

  var $logout = $('.logout');

  var $pkmnSearch = $('#pkmnSearch');
  var $pkmnSearchBtn = $('.pkmn-search-btn');

  var $brewerySearch = $('#brewerySearch');
  var $brewerySearchBtn = $('.brewery-search-btn');

  var userPokemon = localStorage.getItem('pokemonName');
  var userPokemonType = localStorage.getItem('pokemonType');
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

  var computerPokemon = {'pokemon': 'mew', 'health': 200, 'attack': 25};

  function getPokemonInfo(pokemon) {

    $pkmnSearchBtn.attr('disabled', true);
    $.ajax({
      'url': '/pokemon/get?pokemon=' + encodeURIComponent(pokemon),
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
          $pkmnSearchBtn.attr('disabled', false);
        }
      },
      'error': function(error) {
        console.log(pokemon);
        console.log('help me computer');
      }
    });
  }

  // pokemon constructor
  function PokemonDetails(pokeSelect) {
    this.info = {
        pokemonName: pokeSelect.name,
        pokemonTP: pokeSelect.weight,
        pokemonType: pokeSelect.type.type.name,
        pokemonAttacks: pokeSelect.attacks,
    };
    localStorage.setItem('pokemonName', pokeSelect.name);
    localStorage.setItem('pokemonWeight', pokeSelect.weight);
    localStorage.setItem('pokemonType', pokeSelect.type.type.name);
    localStorage.setItem('pokemonAttacks', pokeSelect.attacks);

    var pokemonName = $("<h3>").addClass('selectedPokemon').attr("id", this.info.pokemonName).html(this.info.pokemonName).appendTo('.poke-panel-title');
    var pokeList = $('.poke-ul');
    var pokeTP = $('<li>').html('Tolerance Points (TP)' + ': ' + this.info.pokemonTP).appendTo(pokeList);
    var pokemonType = $('<li>').html('Pokemon Type' + ': ' + this.info.pokemonType).appendTo(pokeList);
  }

  function getBeerAttacks(brewery) {
    $brewerySearchBtn.attr('disabled', true);
    $.ajax({
      'url': '/brewery/get?brewery=' + encodeURIComponent(brewery),
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
          $brewerySearchBtn.attr('disabled', false);
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
  var computerCanAttack = true;
  var userCanDodgeUp = true;
  var userCanDodgeDown = true;
  var userCanDodgeRight = true;
  var userCanDodgeLeft = true;
  // set a timeout like 500 on the computer attack attack to be 0 if userDodged === true, set this in the dodge function with a cooldown on all of them for 10 seconds or whatever. give a timer on dodge.

  function compAttackReset(){
    compDamage = computerPokemon.attack;
  }


  setTimeout(function() {
    $('.countdown').fadeOut('slow');
  }, 2500);

  $('.userHealth').append(userPokemon + "'s health:");
  $('.enemyHealth').append(computerPokemon.pokemon + "s health:");

  $('.battle-page').ready(function() {
    var $userMonPic = $('.userMonPic');
    var $pokemon = localStorage.getItem('pokemonName');
    $userMonPic.css({'background': 'url(/assets/' + $pokemon + '.png)'}).attr('id', $pokemon); // sprite from /app/assets/images/pokesprites/...png
// sprite from /app/assets/images/pokesprites/...png

    console.log('in fight...');

    var compDamage = computerPokemon.attack;
    var loopHandle = setInterval(function() {
      if (userPokemonTP >= 1) {
        $('.mew').effect("shake");
        userPokemonTP -= compDamage;
        console.log(compDamage, 'in comp loop');
      }
    }, 2000);

    $('.battle-page').on('keyup', function(event) {
      var $userHealth = $('.userHealth');
      var $enemyHealth = $('.enemyHealth');
      var enemyHealth = $('<li>').attr("id", 'enemyHP').html(computerPokemon.health).appendTo($enemyHealth);
      var userHealth = $('<li>').attr("id", 'userHP').html(userPokemonTP).appendTo($userHealth);

      userHealth.fadeOut(1500);
      enemyHealth.fadeOut(1500);

      var key = event.keyCode;
      // number 1 button is 49
      if (computerPokemon.health <= 0) {
        alert('You win!');
        clearInterval(loopHandle);
      } else if (userPokemonTP <= 0) {
        alert('I remember my first beer...');
        clearInterval(loopHandle);
      }

      //dodge
      //dodge makes computer damage 0 for x seconds.
      //38 is up arrow
      if (key === 38 && userCanDodgeUp) {
        compDamage = 0;
        userCanDodgeUp = false;
        console.log(compDamage);
        setTimeout(compDamage = computerPokemon.attack, 500);
        console.log(compDamage);
      }

      // battle
      if (key === 49 && userCanAttack) {

        if ((Math.random()*50) <= userCritChanceOne) {

          var damage = userCritOne;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          }
        } else {

          var damage = userDamageOne;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        }
        userCanAttack = false;
        setTimeout(function() {
          userCanAttack = true;
        }, 2000);

      // number 2 button is 50
      } else if (key === 50 && userCanAttack) {

        if ((Math.random()*50) <= userCritChanceTwo) {

          var damage = userCritTwo;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        } else ;{

          var damage = userDamageTwo;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        }
        userCanAttack = false;
        setTimeout(function() {
          userCanAttack = true;
        }, 2000);

      // number 3 button is 51
      } else if (key === 51 && userCanAttack) {

        if ((Math.random()*50) <= userCritChanceThree) {

          var damage = userCritThree;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        } else ;{

          var damage = userDamageThree;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        }
        userCanAttack = false;
        setTimeout(function() {
          userCanAttack = true;
        }, 2000);

      // number 4 button is 52
      } else if (key === 52 && userCanAttack) {

        if ((Math.random()*50) <= userCritChanceFour) {

          var damage = userCritFour;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        } else ;{

          var damage = userDamageFour;

          if (computerPokemon.health - damage > 0) {
            computerPokemon.health -= damage;
            $userMonPic.effect("shake");
          // } else {
          //   computerPokemon.heath <= 0;
          //   alert('You win!');
          //   clearInterval(loopHandle);
          }
        }
        userCanAttack = false;
        setTimeout(function() {
          userCanAttack = true;
        }, 2000);
      }
    });
  });

  $('.logout').on('click', function() {
    window.location.href = '/trainers/sign_in';
  });

  $('.homeBtn').on('click', function() {
    window.location.href = '/game/index';
  });

  $('.pkmnBtn').on('click', function() {
    window.location.href = '/pokemon/index';
  });

  $('.pokemon-selection-btn').on('click', function() {
    window.location.href = '/pokemon/index';
  });

  // $('.pokemon-selection-btn').mouseover(function(){
  //   //moving the div left a bit is completely optional
  //   //but should have the effect of growing the image from the middle.
  //   $(this).stop().animate({"height": "240px","bottom":"-25px"}, 200,'easeInQuint');
  // }).mouseout(function(){
  //   $(this).stop().animate({"height": "230px","bottom":"0px"}, 200,'easeInQuint');
  // });

  $('.brewBtn').on('click', function() {
    window.location.href = '/game/index';
  });

  $('.battle-btn').on('click', function() {
    window.location.href = '/game/battle';
  });

  $('.brew-continue-btn').on('click', function() {
    window.location.href = '/game/loadout';
  });

  $('.poke-continue-btn').on('click', function() {
    window.location.href = '/brewery/index';
  });

  $('.ready-screen-btn').on('click', function() {
    window.location.href = '/game/loadout';
  });

  // $('.ready-screen-btn').mouseover(function(){
  //   //moving the div left a bit is completely optional
  //   //but should have the effect of growing the image from the middle.
  //   $(this).stop().toggle({"scale": "110%"}, 200,'easeInQuint');
  // });//.mouseout(function(){
  //   //$(this).stop().animate({"scale": "100%"}, 200,'easeInQuint');
  // //});

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
  }



  $pkmnSearchBtn.on('click', function() {
    // $pkmnSearchBtn.attr('disabled', true);
    var pokemon = $pkmnSearch.val();
    // window.location.href = '/pokemon/get?pokemon=' + encodeURIComponent(pokemon);
    // maybe add a delay here or some ajax polling - whatever that is.

    getPokemonInfo(pokemon);

    return false;
  });

  // $pkmnSearch.keyup(function() {
  //   var pokemon = $pkmnSearch.val();
  //   var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
  //
  //   $('.pokemon').show().filter(function() {
  //       var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
  //       return !~text.indexOf(val);
  //   }).hide();
  //   $pkmnSearchBtn.on('click', function() {
  //     // $pkmnSearchBtn.attr('disabled', true);
  //     var pokemon = $pkmnSearch.val();
  //     // window.location.href = '/pokemon/get?pokemon=' + encodeURIComponent(pokemon);
  //     // maybe add a delay here or some ajax polling - whatever that is.
  //
  //     getPokemonInfo(pokemon);
  //
  //     return false;
  //   });
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

  $displayCurrentBtn.on('click', function() {
    var pokeList = $('.pokemonLoadout');
    var attackList = $('.attacks-ul');
    $("<h3>").addClass('selectedPokemon').html(userPokemon).appendTo('.poke-panel-title');
    $('<li>').html('Tolerance Points (TP)' + ': ' + userPokemonTP).appendTo(pokeList);
    $('<li>').html('Pokemon Type' + ': ' + userPokemonType ).appendTo(pokeList);
    $('<li>').html('Attack 1' + ': ' + userAttackOne ).appendTo(attackList);
    $('<li>').html('Attack 2' + ': ' + userAttackTwo ).appendTo(attackList);
    $('<li>').html('Attack 3' + ': ' + userAttackThree ).appendTo(attackList);
    $('<li>').html('Attack 4' + ': ' + userAttackFour ).appendTo(attackList);
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
        "farfetchd",
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



// if (computerCanAttack && userPokemonTP >= 1) {
//   userPokemonTP -= compDamage;
//   console.log('user tp: ', userPokemonTP);
// }
// computerCanAttack = false;
// setTimeout(function() {
//   userCanAttack = true;
//   console.log('user tp: ', userPokemonTP);
// }, 2000);


  // function computerAttacks() {
  //   var compDamage = computerPokemon.attack;
  //   setInterval(function() {
  //     if (userPokemonTP >= 1 && computerCanAttack === true) {
  //     userPokemonTP -= compDamage;
  //     console.log('user tp: ', userPokemonTP);
  //     computerCanAttack = false;
  //     }
  //   }, 2000);
  // }

  // var $startBattle = $('.start-fight-btn');
  //
  // $startBattle.on('click', function() {
  //   if (computerCanAttack && userPokemonTP >= 1) {
  //     userPokemonTP -= compDamage;
  //     console.log('user tp: ', userPokemonTP);
  //   }
  //   computerCanAttack = false;
  //   setTimeout(function() {
  //     userCanAttack = true;
  //     console.log('user tp: ', userPokemonTP);
  //   }, 2000);
  // });
