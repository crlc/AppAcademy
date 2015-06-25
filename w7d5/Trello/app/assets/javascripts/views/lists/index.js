TrelloClone.Views.Lists = Backbone.View.extend({
  template: JST["lists/index"],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({ lists: this.collection });
    this.$el.html(renderedContent);
    return this;
  }
});
