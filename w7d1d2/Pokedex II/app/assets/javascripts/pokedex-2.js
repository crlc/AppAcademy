Pokedex.RootView.prototype.addToyToList = function (toy) {

  var content = JST["toyListItem"]({ toy: toy });
  this.$pokeDetail.find("ul.toys").append(content);
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) { // III
  this.$toyDetail.empty();
  var content = JST["toyDetail"]({ pokes: this.pokes, toy: toy });
  this.$toyDetail.html(content);

  // var $detail = $('<div class="detail">');
  // $detail.append('<img src="' + toy.escape('image_url') + '"><br>');
  // for (var attr in toy.attributes) {
  //   if(attr !== 'pokemon_id' && attr !== 'image_url') {
  //     var $span = $('<span style="font-weight:bold;">');
  //     $span.html(attr + ': ');
  //     $detail.append($span);
  //     $detail.append(toy.get(attr));
  //     $detail.append('<br>');
  //   }
  // }

  // Phase III
  // var $pokemonSelect = $('<select>');
  // $pokemonSelect.data("pokemon-id", toy.get("pokemon_id"));
  // $pokemonSelect.data("toy-id", toy.id);
  // this.pokes.each(function (pokemon) {
  //   var $pokemonOption = $('<option>');
  //   $pokemonOption.attr("value", pokemon.id);
  //   $pokemonOption.text(pokemon.get("name"));
  //   if (pokemon.id == toy.get("pokemon_id")) {
  //     $pokemonOption.prop("selected", true);
  //   }
  //   $pokemonSelect.append($pokemonOption);
  // });
  // $detail.append($pokemonSelect);
};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  var $target = $(event.target);

  var toyId = $target.data('id');
  var pokemonId = $target.data('pokemon-id');

  var pokemon = this.pokes.get(pokemonId);
  var toy = pokemon.toys().get(toyId);

  this.renderToyDetail(toy);
};
