# http://emberjs.com/guides/models/defining-a-store/

Fido.Store = DS.Store.extend()

Fido.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: "api/v1"

Fido.ApplicationSerializer = DS.ActiveModelSerializer.extend()