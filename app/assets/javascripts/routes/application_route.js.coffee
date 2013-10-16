Fido.ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    if Fido.get('session')

      @get('store').find('user', Fido.get('session')).then (user) =>
        session = @store.createRecord('session', {user: user})
        session.save().then (session) =>
          controller = @controllerFor('application')
          controller.set('session', session)
          controller.set('currentUser', session.get('user'))
    else
      controller = @controllerFor('application')
      controller.set('session', @store.createRecord('session'))

  actions:
    login: ->
      session = @get('controller.session')
      if session is null
        console.log 'null sesh'
        @set('controller.session', @store.createRecord('session'))
      else
        session.save().then (session) =>
          @set('controller.currentUser', session.get('user'))
          Fido.set('session', session.get('user.id'))
          console.log 'updating application state'

    logout: ->
      session = @get('controller.session')
      session.deleteRecord()
      session.save().then () =>
        console.log "setting currentUser to null"
        @set('controller.currentUser', null)
        console.log "setting Fido.session to null"
        Fido.set('session', null)
        console.log 'creating a blank session object for logging in again'
        @set('controller.session', @store.createRecord('session'))
        console.log 'session destroyed'
