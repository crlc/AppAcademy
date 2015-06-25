var bubbleSort = function (array) {
        "use strict";
        var i = 0;
        while (i < array.length - 1) {
          if (array[i] > array[i + 1]) {
            var temp = array[i];
            array[i] = array[i + 1];
            array[i + 1] =temp;
            i = 0;
          }
          else {
            i++;
          }
        }

        return array;
    };

var bubbleSort2 = function (array) {
        var notSorted = true;
        while (notSorted) {
          notSorted = false;
          for (var i = 0; i < array.length - 1; i++) {
            if (array[i] > array[i + 1]) {
              notSorted = true;
              var temp = array[i];
              array[i] = array[i + 1];
              array[i + 1] =temp;
            }
          }
        }
          return array;
}

var subString = function (string) {
  var substrings = [];
  for (var i = 0; i < string.length; i++) {
    for ( var j = i + 1; j < string.length +1; j++) {
        var word = "";
        for ( var k = i; k < j; k++) {
          word = word.concat(string[k]);
        }
        substrings.push(word);
    }
  }
  return substrings;
}
