function range(start, end) {
  if (start > end) {
    return array = [];
  }
  else {
    var array = (range(start, end - 1));
    // console.log(start  + " " +end);
    array.push(end);
  }
  return array;
}

var exponent1 = function (base, exp) {
  if (exp === 0) {
    return 1;
  } else {
    return exponent(base, exp -1) * base;
  }
}

var exponent2 = function (base, exp) {
  if (exp === 0) {
    return 1;
  }
  else if (exp === 1) {
    return base;
  }
  else if (exp % 2 === 0) {
    return exponent2(base, exp / 2) * exponent2(base, exp / 2);
  }
  else {
    return exponent2(base, (exp - 1) / 2) * exponent2(base, (exp - 1) / 2) * base;
  }
}

var fib = function (num) {
  if (num === 1) {
    return [0];
  }
  else if (num === 2) {
    return [0 ,1];
  }
  else {
    var fibArray = fib(num - 1);
    fibArray.push(fibArray[fibArray.length -1] + fibArray[fibArray.length -2]);
    return fibArray;
  }
}

var bSearch = function(array, target) {
  var pivot = Math.floor(array.length / 2)
  if (array[pivot] === target) {
    return pivot;
  } else if (array[pivot] < target) {
    var newArray = array.slice(pivot + 1, array.length)
    return bSearch(newArray, target) + pivot + 1;
  } else if (array[pivot] > target) {
    var newArray = array.slice(0, pivot);
    return bSearch(newArray, target);
  } else {
    return null;
  }
}

var makeChange = function (amount, coins) {
  if (amount === 0) {
    return [];
  }
  else {
    for (var i = 0; i < coins.length; i++) {
      if (amount >= coins[i]) {
        var change = makeChange(amount - coins[i], coins);
        change.push(coins[i]);
        return change;
      }
    }
  }
}

var merge = function (arr1, arr2) {
  var result = [];
  while (arr1.length > 0 && arr2.length > 0) {
    if (arr1[0] < arr2[0]) {
      result.push(arr1.shift());
    } else {
      result.push(arr2.shift());
    }
  }
  result = result.concat(arr1).concat(arr2);
  return result;
}

var mergeSort = function (array) {
  if (array.length === 1) {
    return array;
  }

  var pivot = Math.floor(array.length/2);
  var half1 = mergeSort(array.slice(0, pivot));
  var half2 = mergeSort(array.slice(pivot, array.length));

  var sorted = merge(half1, half2);
  return sorted;
}

var subSet = function (array) {
  if (array.length === 0) {
    return [[]];
  }
  else {
    var subsets = subSet(array.slice(0,array.length - 1));
    for (var i = 0; i < array.length; i++) {
      for (var j = i + 1; j < array.length + 1; j++) {
        var sub = array.slice(i,j);
        if (subsets.indexOf(sub) === -1) {
          subsets.push(sub);
          // console.log(sub)
        }
      }
    }
    return subsets;
  }

}
