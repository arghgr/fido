Fido.UsersController = Ember.ArrayController.extend
  sortProperties: ["id"]
  sortAscending: true
  filteredContent: (->
    content = @get "arrangedContent"
    content.filter (item, index) ->
      not item.get "isNew"
  ).property("arrangedContent.@each")

Fido.UsersNewController = Ember.ObjectController.extend
	actions:
	  save: ->
	    user = @get("content")
	    user.save().then (user) =>
	      @transitionToRoute "users.user", user

	  cancel: ->
	    @get("content").deleteRecord()
	    @transitionToRoute("users")