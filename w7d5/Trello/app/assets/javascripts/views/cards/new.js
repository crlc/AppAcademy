TrelloClone.Views.CardForm = Backbone.View.extend({
  tagName: "form",
  template: JST ["cards/form"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({ card: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
