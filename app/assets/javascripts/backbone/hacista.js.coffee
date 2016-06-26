#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Hacista =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new Hacista.Routers.UsersRouter()
    Backbone.history.start()

$(document).ready ->
  Hacista.init()
