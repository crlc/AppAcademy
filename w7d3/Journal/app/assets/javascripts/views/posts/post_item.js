Journal.Views.PostItem = Backbone.View.extend({
  template: JST["posts/post_item"],

  tagName: 'li',

  events: {
    "click .delete-post" : "deletePost"
  },

  render: function () {
    var postItemContent = this.template({ post: this.model });
    this.$el.html(postItemContent);
    return this;
  },

  deletePost: function () {
    this.model.destroy();
    this.remove();
  }

})
