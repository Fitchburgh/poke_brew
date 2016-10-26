require 'json'

hash = {"pokemon_entries" => [
{
"entry_number" => 1,
"pokemon_species" => {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/1/",
"name"=> "bulbasaur"
}
},
{
"entry_number"=> 2,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/2/",
"name"=> "ivysaur"
}
},
{
"entry_number"=> 3,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/3/",
"name"=> "venusaur"
}
},
{
"entry_number"=> 4,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/4/",
"name"=> "charmander"
}
},
{
"entry_number"=> 5,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/5/",
"name"=> "charmeleon"
}
},
{
"entry_number"=> 6,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/6/",
"name"=> "charizard"
}
},
{
"entry_number"=> 7,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/7/",
"name"=> "squirtle"
}
},
{
"entry_number"=> 8,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/8/",
"name"=> "wartortle"
}
},
{
"entry_number"=> 9,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/9/",
"name"=> "blastoise"
}
},
{
"entry_number"=> 10,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/10/",
"name"=> "caterpie"
}
},
{
"entry_number"=> 11,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/11/",
"name"=> "metapod"
}
},
{
"entry_number"=> 12,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/12/",
"name"=> "butterfree"
}
},
{
"entry_number"=> 13,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/13/",
"name"=> "weedle"
}
},
{
"entry_number"=> 14,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/14/",
"name"=> "kakuna"
}
},
{
"entry_number"=> 15,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/15/",
"name"=> "beedrill"
}
},
{
"entry_number"=> 16,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/16/",
"name"=> "pidgey"
}
},
{
"entry_number"=> 17,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/17/",
"name"=> "pidgeotto"
}
},
{
"entry_number"=> 18,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/18/",
"name"=> "pidgeot"
}
},
{
"entry_number"=> 19,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/19/",
"name"=> "rattata"
}
},
{
"entry_number"=> 20,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/20/",
"name"=> "raticate"
}
},
{
"entry_number"=> 21,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/21/",
"name"=> "spearow"
}
},
{
"entry_number"=> 22,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/22/",
"name"=> "fearow"
}
},
{
"entry_number"=> 23,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/23/",
"name"=> "ekans"
}
},
{
"entry_number"=> 24,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/24/",
"name"=> "arbok"
}
},
{
"entry_number"=> 25,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/25/",
"name"=> "pikachu"
}
},
{
"entry_number"=> 26,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/26/",
"name"=> "raichu"
}
},
{
"entry_number"=> 27,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/27/",
"name"=> "sandshrew"
}
},
{
"entry_number"=> 28,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/28/",
"name"=> "sandslash"
}
},
{
"entry_number"=> 29,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/29/",
"name"=> "nidoran-f"
}
},
{
"entry_number"=> 30,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/30/",
"name"=> "nidorina"
}
},
{
"entry_number"=> 31,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/31/",
"name"=> "nidoqueen"
}
},
{
"entry_number"=> 32,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/32/",
"name"=> "nidoran-m"
}
},
{
"entry_number"=> 33,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/33/",
"name"=> "nidorino"
}
},
{
"entry_number"=> 34,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/34/",
"name"=> "nidoking"
}
},
{
"entry_number"=> 35,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/35/",
"name"=> "clefairy"
}
},
{
"entry_number"=> 36,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/36/",
"name"=> "clefable"
}
},
{
"entry_number"=> 37,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/37/",
"name"=> "vulpix"
}
},
{
"entry_number"=> 38,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/38/",
"name"=> "ninetales"
}
},
{
"entry_number"=> 39,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/39/",
"name"=> "jigglypuff"
}
},
{
"entry_number"=> 40,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/40/",
"name"=> "wigglytuff"
}
},
{
"entry_number"=> 41,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/41/",
"name"=> "zubat"
}
},
{
"entry_number"=> 42,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/42/",
"name"=> "golbat"
}
},
{
"entry_number"=> 43,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/43/",
"name"=> "oddish"
}
},
{
"entry_number"=> 44,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/44/",
"name"=> "gloom"
}
},
{
"entry_number"=> 45,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/45/",
"name"=> "vileplume"
}
},
{
"entry_number"=> 46,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/46/",
"name"=> "paras"
}
},
{
"entry_number"=> 47,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/47/",
"name"=> "parasect"
}
},
{
"entry_number"=> 48,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/48/",
"name"=> "venonat"
}
},
{
"entry_number"=> 49,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/49/",
"name"=> "venomoth"
}
},
{
"entry_number"=> 50,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/50/",
"name"=> "diglett"
}
},
{
"entry_number"=> 51,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/51/",
"name"=> "dugtrio"
}
},
{
"entry_number"=> 52,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/52/",
"name"=> "meowth"
}
},
{
"entry_number"=> 53,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/53/",
"name"=> "persian"
}
},
{
"entry_number"=> 54,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/54/",
"name"=> "psyduck"
}
},
{
"entry_number"=> 55,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/55/",
"name"=> "golduck"
}
},
{
"entry_number"=> 56,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/56/",
"name"=> "mankey"
}
},
{
"entry_number"=> 57,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/57/",
"name"=> "primeape"
}
},
{
"entry_number"=> 58,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/58/",
"name"=> "growlithe"
}
},
{
"entry_number"=> 59,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/59/",
"name"=> "arcanine"
}
},
{
"entry_number"=> 60,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/60/",
"name"=> "poliwag"
}
},
{
"entry_number"=> 61,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/61/",
"name"=> "poliwhirl"
}
},
{
"entry_number"=> 62,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/62/",
"name"=> "poliwrath"
}
},
{
"entry_number"=> 63,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/63/",
"name"=> "abra"
}
},
{
"entry_number"=> 64,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/64/",
"name"=> "kadabra"
}
},
{
"entry_number"=> 65,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/65/",
"name"=> "alakazam"
}
},
{
"entry_number"=> 66,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/66/",
"name"=> "machop"
}
},
{
"entry_number"=> 67,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/67/",
"name"=> "machoke"
}
},
{
"entry_number"=> 68,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/68/",
"name"=> "machamp"
}
},
{
"entry_number"=> 69,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/69/",
"name"=> "bellsprout"
}
},
{
"entry_number"=> 70,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/70/",
"name"=> "weepinbell"
}
},
{
"entry_number"=> 71,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/71/",
"name"=> "victreebel"
}
},
{
"entry_number"=> 72,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/72/",
"name"=> "tentacool"
}
},
{
"entry_number"=> 73,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/73/",
"name"=> "tentacruel"
}
},
{
"entry_number"=> 74,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/74/",
"name"=> "geodude"
}
},
{
"entry_number"=> 75,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/75/",
"name"=> "graveler"
}
},
{
"entry_number"=> 76,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/76/",
"name"=> "golem"
}
},
{
"entry_number"=> 77,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/77/",
"name"=> "ponyta"
}
},
{
"entry_number"=> 78,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/78/",
"name"=> "rapidash"
}
},
{
"entry_number"=> 79,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/79/",
"name"=> "slowpoke"
}
},
{
"entry_number"=> 80,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/80/",
"name"=> "slowbro"
}
},
{
"entry_number"=> 81,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/81/",
"name"=> "magnemite"
}
},
{
"entry_number"=> 82,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/82/",
"name"=> "magneton"
}
},
{
"entry_number"=> 83,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/83/",
"name"=> "farfetchd"
}
},
{
"entry_number"=> 84,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/84/",
"name"=> "doduo"
}
},
{
"entry_number"=> 85,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/85/",
"name"=> "dodrio"
}
},
{
"entry_number"=> 86,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/86/",
"name"=> "seel"
}
},
{
"entry_number"=> 87,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/87/",
"name"=> "dewgong"
}
},
{
"entry_number"=> 88,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/88/",
"name"=> "grimer"
}
},
{
"entry_number"=> 89,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/89/",
"name"=> "muk"
}
},
{
"entry_number"=> 90,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/90/",
"name"=> "shellder"
}
},
{
"entry_number"=> 91,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/91/",
"name"=> "cloyster"
}
},
{
"entry_number"=> 92,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/92/",
"name"=> "gastly"
}
},
{
"entry_number"=> 93,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/93/",
"name"=> "haunter"
}
},
{
"entry_number"=> 94,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/94/",
"name"=> "gengar"
}
},
{
"entry_number"=> 95,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/95/",
"name"=> "onix"
}
},
{
"entry_number"=> 96,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/96/",
"name"=> "drowzee"
}
},
{
"entry_number"=> 97,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/97/",
"name"=> "hypno"
}
},
{
"entry_number"=> 98,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/98/",
"name"=> "krabby"
}
},
{
"entry_number"=> 99,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/99/",
"name"=> "kingler"
}
},
{
"entry_number"=> 100,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/100/",
"name"=> "voltorb"
}
},
{
"entry_number"=> 101,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/101/",
"name"=> "electrode"
}
},
{
"entry_number"=> 102,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/102/",
"name"=> "exeggcute"
}
},
{
"entry_number"=> 103,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/103/",
"name"=> "exeggutor"
}
},
{
"entry_number"=> 104,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/104/",
"name"=> "cubone"
}
},
{
"entry_number"=> 105,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/105/",
"name"=> "marowak"
}
},
{
"entry_number"=> 106,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/106/",
"name"=> "hitmonlee"
}
},
{
"entry_number"=> 107,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/107/",
"name"=> "hitmonchan"
}
},
{
"entry_number"=> 108,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/108/",
"name"=> "lickitung"
}
},
{
"entry_number"=> 109,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/109/",
"name"=> "koffing"
}
},
{
"entry_number"=> 110,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/110/",
"name"=> "weezing"
}
},
{
"entry_number"=> 111,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/111/",
"name"=> "rhyhorn"
}
},
{
"entry_number"=> 112,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/112/",
"name"=> "rhydon"
}
},
{
"entry_number"=> 113,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/113/",
"name"=> "chansey"
}
},
{
"entry_number"=> 114,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/114/",
"name"=> "tangela"
}
},
{
"entry_number"=> 115,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/115/",
"name"=> "kangaskhan"
}
},
{
"entry_number"=> 116,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/116/",
"name"=> "horsea"
}
},
{
"entry_number"=> 117,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/117/",
"name"=> "seadra"
}
},
{
"entry_number"=> 118,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/118/",
"name"=> "goldeen"
}
},
{
"entry_number"=> 119,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/119/",
"name"=> "seaking"
}
},
{
"entry_number"=> 120,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/120/",
"name"=> "staryu"
}
},
{
"entry_number"=> 121,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/121/",
"name"=> "starmie"
}
},
{
"entry_number"=> 122,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/122/",
"name"=> "mr-mime"
}
},
{
"entry_number"=> 123,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/123/",
"name"=> "scyther"
}
},
{
"entry_number"=> 124,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/124/",
"name"=> "jynx"
}
},
{
"entry_number"=> 125,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/125/",
"name"=> "electabuzz"
}
},
{
"entry_number"=> 126,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/126/",
"name"=> "magmar"
}
},
{
"entry_number"=> 127,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/127/",
"name"=> "pinsir"
}
},
{
"entry_number"=> 128,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/128/",
"name"=> "tauros"
}
},
{
"entry_number"=> 129,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/129/",
"name"=> "magikarp"
}
},
{
"entry_number"=> 130,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/130/",
"name"=> "gyarados"
}
},
{
"entry_number"=> 131,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/131/",
"name"=> "lapras"
}
},
{
"entry_number"=> 132,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/132/",
"name"=> "ditto"
}
},
{
"entry_number"=> 133,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/133/",
"name"=> "eevee"
}
},
{
"entry_number"=> 134,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/134/",
"name"=> "vaporeon"
}
},
{
"entry_number"=> 135,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/135/",
"name"=> "jolteon"
}
},
{
"entry_number"=> 136,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/136/",
"name"=> "flareon"
}
},
{
"entry_number"=> 137,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/137/",
"name"=> "porygon"
}
},
{
"entry_number"=> 138,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/138/",
"name"=> "omanyte"
}
},
{
"entry_number"=> 139,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/139/",
"name"=> "omastar"
}
},
{
"entry_number"=> 140,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/140/",
"name"=> "kabuto"
}
},
{
"entry_number"=> 141,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/141/",
"name"=> "kabutops"
}
},
{
"entry_number"=> 142,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/142/",
"name"=> "aerodactyl"
}
},
{
"entry_number"=> 143,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/143/",
"name"=> "snorlax"
}
},
{
"entry_number"=> 144,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/144/",
"name"=> "articuno"
}
},
{
"entry_number"=> 145,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/145/",
"name"=> "zapdos"
}
},
{
"entry_number"=> 146,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/146/",
"name"=> "moltres"
}
},
{
"entry_number"=> 147,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/147/",
"name"=> "dratini"
}
},
{
"entry_number"=> 148,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/148/",
"name"=> "dragonair"
}
},
{
"entry_number"=> 149,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/149/",
"name"=> "dragonite"
}
},
{
"entry_number"=> 150,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/150/",
"name"=> "mewtwo"
}
},
{
"entry_number"=> 151,
"pokemon_species"=> {
"url"=> "https=>//pokeapi.co/api/v2/pokemon-species/151/",
"name"=> "mew"
}
}
]
}

name_id = []
hash.each do |key, array|
  array.each do |new_hash|
    number = new_hash['entry_number']
    name = new_hash['pokemon_species']['name']

    name_id << { 'number' => "#{number}", 'name' => "#{name}" }
  end
end

p JSON.pretty_generate(name_id)
# File.open('name_id.json', 'w') do |f|
#   f.puts name_id.to_json
# end
#
