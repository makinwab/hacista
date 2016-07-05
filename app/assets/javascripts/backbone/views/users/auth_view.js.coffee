Hacista.Views.Users ||= {}

class Hacista.Views.Users.AuthView extends Backbone.View
  template: JST["backbone/templates/users/auth"]

  initialize: ->
    console.log @model

  events:
    "submit #sign-in": "signin"
    "click a.signup": "signup"

  render: ->
    $(@el).html(@template())
    this

  signin: (event) ->
    event.preventDefault()
    data = {}
    # get user data from the form
    form_fields = $("#sign-in :input")
    _.each form_fields, (field) ->
      if !_.isEmpty field.name
        data[field.name] = field.value
    # send data to backend for authentication
    @authenticate(data)

  authenticate: (data) ->
    @model.save(data, {
      url: @model.url("auth"),
      wait: true,
      success: @redirect_to_dashboard
    })

  redirect_to_dashboard: (model) ->
    #save in localStorage
    window.localStorage.setItem("userhash", model.get("id"))
    #redirect to dashboard page
    window.location = "#dashboard"

  signup: (event) ->
    event.preventDefault()
    #redirect ot homepage
    window.location = "/"
