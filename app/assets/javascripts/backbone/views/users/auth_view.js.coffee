Hacista.Views.Users ||= {}

class Hacista.Views.Users.AuthView extends Backbone.View
  template: JST["backbone/templates/users/auth"]

  initialize: ->
    console.log @model

  events:
    "submit #sign-in": "signin"

  render: ->
    $(@el).html(@template())
    this

  signin: (event) ->
    event.preventDefault()
    console.log "signin"
