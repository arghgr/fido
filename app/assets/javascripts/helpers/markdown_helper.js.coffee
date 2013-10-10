window.showdown = new Showdown.converter()

Ember.Handlebars.registerBoundHelper "markdown", (input) ->
  new Ember.Handlebars.SafeString window.showdown.makeHtml(input) if input # need to check if input is defined and not null