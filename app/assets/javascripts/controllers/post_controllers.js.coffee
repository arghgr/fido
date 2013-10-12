Fido.PostsPostController = Ember.ObjectController.extend
  isEditing: false
  newCommentText: null

  actions:
    createComment: (text) ->
      post = this.get('content')
      comment = @store.createRecord('comment', {post: post, text: text})
      comment.save().then =>
        @set('newCommentText', null)

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
