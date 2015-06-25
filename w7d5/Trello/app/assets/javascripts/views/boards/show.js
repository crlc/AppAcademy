TrelloClone.Views.BoardShow = Backbone.View.extend({
  template: JST["boards/show"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      board: this.model
    });
    this.$el.html(renderedContent);
    var view = this;

    this.model.lists().each(function (list) {
      var listShowView = new TrelloClone.Views.ListShow({
        model: list
      });
      view.$(".container").append(listShowView.render().$el);
      list.cards().each(function (card) {
        var cardShowView = new TrelloClone.Views.CardShow({
          model: card
        });
        view.$(".stack").append(cardShowView.render().$el);
      });
    });

    return this;
  }
});
