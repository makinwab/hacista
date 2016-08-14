class Hacista.Routers.DashboardsRouter extends Backbone.Router

  initialize: ->
    @model = new Hacista.Models.User()

  routes:
    "dashboard"        : "index"

  index: ->
    @view = new Hacista.Views.Dashboards.IndexView(model: @model)
    $("#container").html(@view.render().el)
