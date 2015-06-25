TrelloClone.Views.ListForm = Backbone.View.extend({
  tagName: "form",
  template: JST ["lists/form"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({ list: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
