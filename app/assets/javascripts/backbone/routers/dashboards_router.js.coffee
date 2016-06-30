class Hacista.Routers.DashboardsRouter extends Backbone.Router

  routes:
    "dashboard"        : "index"

  index: ->
    @view = new Hacista.Views.Dashboards.IndexView()
    $("#container").html(@view.render().el)
