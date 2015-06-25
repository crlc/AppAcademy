Journal.Views.PostShow = Backbone.View.extend({
  template: JST["posts/post_show"],

  initialize: function () {
    this.listenTo(this.model, 'sync remove', this.render);
  },

  events: {
    'click input':'deletePost'
  },

  render: function () {
    var postShowContent = this.template({ post: this.model });
    this.$el.html(postShowContent);
    return this;
  },

  deletePost: function () {
    this.model.destroy();
    this.remove();
  }
});
