Journal.Views.PostForm = Backbone.View.extend({
  template: JST["posts/post_form"],

  events: {
    'submit form':'updatePost'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var currentPost = this.model;
    var postFormContent = this.template({ post: this.model });
    this.$el.html(postFormContent);
    return this;
  },

  updatePost: function (event) {
    event.preventDefault();
    var that = this;
    var params = $(event.currentTarget).serializeJSON();
    // var newPost = new Journal.Models.Post(params["post"]);
    this.model.save(params, {
      success: function() {
        var postId = that.model.id;
        this.collection && this.collection.add(this.model);
        Backbone.history.navigate('posts/' + postId, {trigger: true});
      },
      error: function(resp) {
        console.log(resp);
      },
      wait: true
    });
  }
});
