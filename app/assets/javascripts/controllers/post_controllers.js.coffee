Fido.PostsPostController = Ember.ObjectController.extend
  isEditing: false
  actions:
    edit: ->
      @set "isEditing", true

    delete: ->
      if window.confirm "are you sure you want to delete this post?"
        @get("content").deleteRecord()
        @get("content").save().then =>
          @transitionToRoute "posts"

    doneEditing: ->
      post = @get("content")
      post.save().then =>
        @set "isEditing", false