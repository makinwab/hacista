class Hacista.Routers.UsersRouter extends Backbone.Router

  initialize: ->
    @model = new Hacista.Models.User()

  routes:
    "entries/:id" : "show"
    ""        : "index"

  index: ->
    @view = new Hacista.Views.Users.IndexView(model: @model)
    $("#container").html(@view.render().el)

  show: (id) ->
    alert id
