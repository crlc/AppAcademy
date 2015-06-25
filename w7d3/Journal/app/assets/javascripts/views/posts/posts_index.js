Journal.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  tagName: 'ul',

  initialize: function() {
    this.listenTo(this.collection, 'remove reset sync', this.render);
  },

  render: function () {
    var postsIndexContent = this.template();
    this.$el.html(postsIndexContent);
    this.collection.each( function (post) {
      var view  = new Journal.Views.PostItem({ model: post });
      this.$el.append(view.render().$el);
    }, this);

    return this;
  }

});
