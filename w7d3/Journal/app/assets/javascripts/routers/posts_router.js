Journal.Routers.Posts = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.posts = options.collection;
  },

  routes: {
    '':'index',
    'posts/new':'new',
    'posts/:id':'show',
    'posts/:id/edit':'edit'
  },

  edit: function (id) {
    var post = this.posts.getOrFetch(id);
    var postFormView = new Journal.Views.PostForm({ model: post });
    this._swapView(postFormView);
  },

  index: function () {
    var posts = new Journal.Collections.Posts();
    var that = this;
    posts.fetch({
      success: function () {
        var indexView = new Journal.Views.PostsIndex({ collection: posts });
        that._swapView(indexView);
      }
    });
  },

  new: function () {
    var post = new Journal.Models.Post();
    var postFormView = new Journal.Views.PostForm({ collection: this.posts, model: post});
    this._swapView(postFormView);
  },

  show: function (id) {
    var post = this.posts.getOrFetch(id);
    var postShowView = new Journal.Views.PostShow({ model: post });
    this._swapView(postShowView);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }
});
