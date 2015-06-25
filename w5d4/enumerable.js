var myEach = function (array, myFunc) {
        "use strict";
        for (var i = 0; i < array.length; i++) {
          myFunc(array[i]);
        }
  return array;
}

var myFunc = function (num1, num2) {
  "use strict";
  return num1 + num2;
}

var myMap = function (array, myFunc) {
  "use strict";
  var newArray = [];

  var newFunc = function (arg) {
    newArray.push(myFunc(arg));
  }

  myEach(array, newFunc);

  return newArray;
}

var myInject = function (array, myFunc) {
  "use strict";
  var accumulator = array[0];
  var newArray = [];
  for (var i = 1; i < array.length; i++ ) {
    newArray.push(array[i]);
  }

  var newFunc = function (arg) {
    "use strict";
    accumulator = myFunc(accumulator, arg);
  }

  myEach(newArray, newFunc);
  return accumulator;
}

// [1,2,3,4,5].inject() {|accum, num| accum + num}
