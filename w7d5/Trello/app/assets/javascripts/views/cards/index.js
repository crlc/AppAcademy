TrelloClone.Views.Cards = Backbone.View.extend({
  template: JST["cards/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({ cards: this.collection });
    this.$el.html(renderedContent);
    return this;
  }
});
