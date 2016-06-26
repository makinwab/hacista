class Hacista.Routers.UsersRouter extends Backbone.Router
  routes:
    "entries/:id" : "show"
    ""        : "index"

  index: ->
    @view = new Hacista.Views.Users.IndexView()
    $("#container").html(@view.render().el)

  show: (id) ->
    alert id
