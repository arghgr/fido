Fido.UsersUserController = Ember.ObjectController.extend
	isEditing: false
	actions:
	  edit: ->
	    @set "isEditing", true

	  delete: ->
	    if window.confirm "are you sure you want to delete this user?"
	      @get("content").deleteRecord()
	      @get("content").save().then =>
	        @transitionToRoute "users"

	  doneEditing: ->
	    user = @get("content")
	    user.save().then =>
	      @set "isEditing", false