Fido.UsersRoute = Ember.Route.extend
	model: ->
		@store.find("user")

Fido.UsersNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord("user", {
      name: ""
      password: ""
    })