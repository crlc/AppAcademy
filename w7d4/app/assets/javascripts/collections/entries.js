NewsReader.Collections.Entries = Backbone.Collection.extend({
  model: NewsReader.Models.Entry,

  url: function () {
    return '/api/feeds/' + this.feed.id + '/entries';
  },

  comparator: -'published_at'
});
