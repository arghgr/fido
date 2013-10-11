Fido.PostsRoute = Ember.Route.extend
  model: ->
    @store.find("post")

Fido.PostsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord("post", {
      publishedAt: new Date()
      author: "current user"
    })

Fido.PostsPostRoute = Ember.Route.extend

  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set('newComment', @store.createRecord('comment', {post: model}))
