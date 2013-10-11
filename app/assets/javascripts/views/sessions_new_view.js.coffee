Fido.SessionsNewView = Ember.View.extend

  actions:
    login: ->
      console.log 'doing view stuff'
      @get('controller').send('login')