class Hacista.Routers.UsersRouter extends Backbone.Router

  initialize: ->
    @model = new Hacista.Models.User()

  routes:
    ""        : "index"
    "/*"        : "index"
    "entries/:id" : "show"
    "auth"   : "signin"

  index: ->
    @view = new Hacista.Views.Users.IndexView(model: @model)
    $("#container").html(@view.render().el)

  show: (id) ->
    alert id

  signin: ->
    @view = new Hacista.Views.Users.AuthView(model: @model)
    $("#container").html(@view.render().el)
