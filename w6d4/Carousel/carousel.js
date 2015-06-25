$.Carousel = function (el) {
  this.$el = $(el);
  this.activeIdx = 0;
  $('.items').children().first().addClass('active');
  this.$el.on('click', '.slide-left', this.slideLeft.bind(this));
  this.$el.on('click', '.slide-right', this.slideRight.bind(this));
};

$.Carousel.prototype.slideLeft = function() {
  this.slide(1);
};

$.Carousel.prototype.slideRight = function() {
  this.slide(-1);
};

$.Carousel.prototype.slide = function (dir) {
  // debugger
  this.activeIdx = (this.activeIdx + (dir + $('img').length)) % $('img').length;
  var dirClass;
  var oppDirClass;
  if (dir === 1) {
    dirClass = "left";
    oppDirClass = "right";
  } else {
    dirClass = "right";
    oppDirClass = "left";
  }
  var $oldImage = $('.active');
  var $newImage = $('img').eq(this.activeIdx);

  $newImage.addClass('active');
  $newImage.addClass(dirClass);
  // $oldImage.addClass(oppDirClass);

  setTimeout( function() {
    // $oldImage.removeClass(oppDirClass);
    $newImage.removeClass(dirClass);
    $oldImage.addClass(oppDirClass);
      $oldImage.one( "transitionend", function () {
        $oldImage.removeClass('active');
        $oldImage.removeClass(oppDirClass);
      });
  }, 0);



  // $newImage.addClass(dirClass);
  // $newImage.addClass('active');
  //
  // $oldImage.addClass(dirClass);
  //
  // $oldImage.one("transitionend", function () {
  //
  //   $oldImage.removeClass(dirClass);
  //   setTimeout( function() {
  //
  //     $oldImage.removeClass("active");
  //     $newImage.removeClass(dirClass);
  //   }, 0);
  // });

};

$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};
