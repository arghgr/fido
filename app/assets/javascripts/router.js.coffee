# For more information see: http://emberjs.com/guides/routing/

Fido.Router.map ()->
  @resource "about"
  @resource "posts", ->
    @route "post", path: ":post_id"
    @route "new"
