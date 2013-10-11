Fido.Session = DS.Model.extend
  name: DS.attr 'string'
  password: DS.attr 'string'
  user: DS.belongsTo 'user'