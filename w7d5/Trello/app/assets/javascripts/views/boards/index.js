TrelloClone.Views.BoardsIndex = Backbone.View.extend({
  template: JST["boards/index"],

  events: {
    "click .delete": "destroyBoard"
  },

  destroyBoard: function (event) {
    var $target = $(event.currentTarget);
    var board = this.collection.get($target.attr("data-id"));
    board.destroy();
  },

  initialize: function () {
    this.listenTo(this.collection, "add sync remove reset", this.render);
  },

  // addBoard: function (board) {
  //   var view = new TrelloClone.Views.Board({ model: board });
  //     this.addSubview(".board-index", view);
  // },
  //
  // addSubview: function (selector, view) {
  //
  // },

  render: function () {
    var renderedContent = this.template({ boards: this.collection });
    this.$el.html(renderedContent);
    // this.collection.each(this.addBoard.bind(this));
    return this;
  }
});
