Hacista.Views.Dashboards ||= {}

class Hacista.Views.Dashboards.IndexView extends Backbone.View
  template: JST["backbone/templates/dashboards/index"]

  render: ->
    @$el.html(@template())
    this
