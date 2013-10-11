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

Fido.CommentsNewController = Ember.ObjectController.extend
  content: null # comment object

  needs: ['postsPost']

  actions:
    save: ->
      this.get('content').save().then () =>
        post = @get('controllers.postsPost.content')
        newComment = @get('store').createRecord('comment', {post: post})
        @set('controllers.postsPost.newComment', newComment)
