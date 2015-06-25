TrelloClone.Views.CardShow = Backbone.View.extend({
  className: "cards",
  template: JST["cards/index"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      card: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
