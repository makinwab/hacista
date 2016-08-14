Hacista.Views.Dashboards ||= {}

class Hacista.Views.Dashboards.IndexView extends Backbone.View
  template: JST["backbone/templates/dashboards/index"]

  events: ->
    "click .dashboard-nav": "activateLink"
    "click .dashboard-logout a": "logout"

  render: ->
    @$el.html(@template())
    this

  activateLink: (event) ->
    event.preventDefault()
    $(".dashboard-nav").removeClass("is-active")
    current = event.currentTarget
    $(current).addClass("is-active")
    $(".mdl-layout__tab-panel").removeClass("is-active")
    id = $(current).attr("href").split("#")[1]
    $("#"+id).addClass("is-active")

  logout: (event) ->
    event.preventDefault()
    @model.fetch
      url: @model.url("logout")
      success: @redirectToRoot
      error: @handleError

  redirectToRoot: (model, response) ->
    window.location = "/"

  handleError: (model, response) ->
    if response.status == 422
      window.location = "/#auth"
