TrelloClone.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index",
    "api/boards/new": "new",
    "api/boards/:board_id": "show"
  },

  index: function () {
    TrelloClone.Collections.boards.fetch();

    var indexView = new TrelloClone.Views.BoardsIndex({
      collection: TrelloClone.Collections.boards
    });

    this._swapView(indexView);
  },

  new: function () {
    var newBoard = new TrelloClone.Models.Board();
    var formView = new TrelloClone.Views.BoardForm({
      model: newBoard,
      collection: TrelloClone.Collections.boards
    });

    this._swapView(formView);
  },

  show: function (board_id) {
    var board = TrelloClone.Collections.boards.getOrFetch(board_id);
    var formView = new TrelloClone.Views.BoardShow({ model: board });

    this._swapView(formView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
