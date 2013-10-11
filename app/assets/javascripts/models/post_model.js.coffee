# See Discussion at http://stackoverflow.com/questions/14705124/creating-a-record-with-ember-js-ember-data-rails-and-handling-list-of-record

Fido.Post = DS.Model.extend
  title: DS.attr("string")
  user: DS.belongsTo("user")
  intro: DS.attr("string")
  extended: DS.attr("string")
  publishedAt: DS.attr("date")
  comments: DS.hasMany("comment")

  numComments: (->
    this.get('comments').filterProperty('isNew', false).get('length')
  ).property('comments.length')