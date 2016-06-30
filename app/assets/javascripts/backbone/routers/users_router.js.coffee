class Hacista.Routers.UsersRouter extends Backbone.Router

  initialize: ->
    @collection = new Hacista.Collections.UsersCollection()

  routes:
    "entries/:id" : "show"
    ""        : "index"

  index: ->
    @view = new Hacista.Views.Users.IndexView(collection: @collection)
    $("#container").html(@view.render().el)

  show: (id) ->
    alert id
