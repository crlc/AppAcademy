TrelloClone.Views.ListShow = Backbone.View.extend({
  className: "stack col-xs-3 .col-sm-3",
  template: JST["lists/index"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      list: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
