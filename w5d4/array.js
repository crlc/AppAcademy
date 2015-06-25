var uniq = function (array) {
  var uniqArray = [];
  for (var i = 0; i < array.length; i++) {
    if (uniqArray.indexOf(array[i]) === -1) {
      uniqArray.push(array[i]);
    }
  }

  return uniqArray;
}

var twoSum = function (array) {
  var twosum = [];
  for (var i = 0; i < array.length - 1; i++) {
    for (var j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] === 0) {
        twosum.push([i, j]);
      }
    }
  }

  return twosum;
}

var myTranspose = function (array) {
  var transposedArray = [];
  for (var k = 0; k < array.length; k++) {
    transposedArray.push([]);
  }

  for (var i = 0; i < array.length; i++) {
    for (var j = 0; j <array.length; j++) {
      transposedArray[j][i] = array[i][j];
    }
  }

  return transposedArray;
}
