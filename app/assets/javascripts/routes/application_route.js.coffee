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
      if session is null
        console.log 'null sesh'
        @set('controller.session', @store.createRecord('session'))
        # session.save().then (session) =>
        #   @set('controller.currentUser', session.get('user'))
        console.log 'updating app state'
      else
        session.save().then (session) =>
          @set('controller.currentUser', session.get('user'))
          console.log 'updating application state'

    logout: ->
      # @get('store').find('session').then (session) =>
      #   session.deleteRecord()
      #   session.save()
      console.log "setting currentUser to null"
      @set('controller.currentUser', null)
      console.log "setting Fido.session to null"
      Fido.set('session', null)
      console.log 'session destroyed'
