Fido.PostsController = Ember.ArrayController.extend
  sortProperties: ["id"]
  sortAscending: false
  filteredContent: (->
    content = @get "arrangedContent"
    content.filter (item, index) ->
      not item.get "isNew"
  ).property("arrangedContent.@each")

Fido.PostsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      post = @get("content")
      post.save().then (post) =>
        @transitionToRoute "posts.post", post

    cancel: ->
      @get("content").deleteRecord()
      @transitionToRoute("posts")