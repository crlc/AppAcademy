$.Tabs = function (el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.data('content-tabs'));
  this.$activeTab = this.$contentTabs.find('.active');
  this.$el.on("click", 'a', this.clickTab.bind(this) );
  this.transitioning = false;
};

$.Tabs.prototype.clickTab = function (event) {
  event.preventDefault();
  if (this.transitioning === true) {
    return;
  }
  this.transitioning = true;
  //reassign active class to appropriate link
  this.$el.find('a').removeClass('active');


  //transition, and add active class to appropriate tab-pane
  this.$activeTab.removeClass('active').addClass('transitioning');
  var $currentTarget = $(event.currentTarget);
  var $newActiveTab = this.$contentTabs.find($currentTarget.attr('for'));
  $currentTarget.addClass('active');

  this.$activeTab.one("transitionend webkitTransitionEnd oTransitionEnd", (function () {
    this.$activeTab.removeClass('transitioning');
    this.$activeTab = $newActiveTab;
    this.$activeTab.addClass('transitioning');

    setTimeout((function () {
      this.$activeTab.removeClass('transitioning').addClass("active");
      this.transitioning = false;
    }).bind(this), 0);
  }).bind(this));

};


$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};
