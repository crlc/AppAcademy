TrelloClone.Collections.Lists = Backbone.Collection.extend({
  model: TrelloClone.Models.List,
  url: "/api/lists",

  comparator: function (list) {
    return list.get("ord");
  },

  getOrFetch: function (id) {
    var list = this.get(id);
    var lists = this;

    if (!list) {
      list = new TrelloClone.Models.List({ id: id });
      list.fetch({
        success: function() {
          lists.add(list);
        }
      });
    } else {
      list.fetch();
    }
    return list;
  }
});
