Fido.CommentBoxComponent = Ember.Component.extend

  someText: null

  actions:
    submitComment: ->
      @sendAction('submit', @get('someText'))