Hacista.Views.Users ||= {}

class Hacista.Views.Users.AuthView extends Backbone.View
  template: JST["backbone/templates/users/auth"]

  events:
    "submit #sign-in": "signIn"
    "click a.signup": "signUp"

  render: ->
    $(@el).html(@template())
    this

  signIn: (event) ->
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
    @model.save data,
      url: @model.url("auth")
      wait: true
      success: @redirectToDashboard
      error: @handleError

  handleError: (model, response) ->
    if response.status == 404
      errorMessage = $.parseJSON(response.responseText).error
      Snackbar.show
        text: errorMessage
        pos: 'top-right'
        width: '475px'
        textColor: '#D1C4E9'
        actionTextColor: '#ff9800'
        customClass: 'snack'

  redirectToDashboard: (model) ->
    #redirect to dashboard page
    window.location = "#dashboard"

  signUp: (event) ->
    event.preventDefault()
    window.location = "/" #redirect to homepage
