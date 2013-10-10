# http://emberjs.com/guides/models/defining-a-store/

Fido.Store = DS.Store.extend
  revision: 12
  adapter: "DS.RESTAdapter" # "DS.FixtureAdapter"

DS.RESTAdapter.reopen
  namespace: "api/v1"