Fido.Comment = DS.Model.extend
  user: DS.belongsTo "user"
  post: DS.belongsTo "post"
  createdAt: DS.attr "date"
  text: DS.attr "string"