Fido.ApplicationController = Ember.Controller.extend
  session: null
  currentUser: null

  isLoggedIn: (->
    @get('currentUser')?
  ).property('currentUser')