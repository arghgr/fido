Fido.SessionsNewController = Ember.ObjectController.extend
  needs: ['application']

  isLoggedInBinding: 'controllers.application.isLoggedIn'