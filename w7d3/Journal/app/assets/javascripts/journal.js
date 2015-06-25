window.Journal = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var posts = new Journal.Collections.Posts();
    posts.fetch();
    var container = $('.content');
    new Journal.Routers.Posts({ collection: posts, $rootEl: container });

    var sidebar = $('.sidebar');
    var sidebarIndex = new Journal.Views.PostsIndex({ collection: posts, $el: sidebar });
    sidebar.html(sidebarIndex.render().$el);

    Backbone.history.start();
  }
};

$(document).ready(function(){
  Journal.initialize();
});
