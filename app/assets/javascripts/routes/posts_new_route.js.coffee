Fido.PostsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord("post", {
      publishedAt: new Date()
      author: "current user"
    })
