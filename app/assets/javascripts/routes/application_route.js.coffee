Fido.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    if Fido.session
      @get('store').find('user', Fido.session).then (user) =>
        @set('controller.currentUser', user)
    else
      controller.set('session', @store.createRecord('session'))

  actions:
    login: ->
      session = @get('controller.session')
      session.save().then (session) =>
        @set('controller.currentUser', session.get('user'))
        console.log 'updating application state'