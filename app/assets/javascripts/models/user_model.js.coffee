Fido.User = DS.Model.extend
  name: DS.attr("string")
  password: DS.attr("string")
  posts: DS.hasMany('post')