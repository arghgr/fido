# See Discussion at http://stackoverflow.com/questions/14705124/creating-a-record-with-ember-js-ember-data-rails-and-handling-list-of-record

Fido.Post = DS.Model.extend
  title: DS.attr("string")
  author: DS.attr("string")
  intro: DS.attr("string")
  extended: DS.attr("string")
  publishedAt: DS.attr("date")