Hacista.Views.Users ||= {}

class Hacista.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initalize: ->
   console.log "IndexView"

  events:
    "submit #new_user": "create_user"
    "click .new": "create_user"
    "click a.login": "sign_in"
    "click .password-toggle span": "toggle_password"

  render: ->
    $(@el).html(@template(entries: "Entries here"))
    this

  create_user: (event) ->
    event.preventDefault()
    @show_loader "block" #show progress bar

    form_fields = $("#new_user :input")
    data = {}

    _.each form_fields, (field) ->
      if !_.isEmpty field.name
        data[field.name] = field.value

    @model.save data,
      wait: true
      success: @redirect_to_dashboard
      error: @handleError

    @show_loader "none" #hide progress bar

  handleError: (model, response) ->
   if response.status == 422
     error = $.parseJSON(response.responseText)
     _.each error, (message, attribute) ->
       Snackbar.show
         text: attribute + " " + message[0]
         pos: 'top-right'
         width: '475px'
         showAction: false
         customClass: 'snack'

  redirect_to_dashboard: (model) ->
    $("#new_user")[0].reset() #reset form
    window.location = "/dashboard" #redirect user to dashboard

  sign_in: (event) ->
    event.preventDefault()
    window.location = "#auth"

  show_loader: (display) ->
    $("#p2").css("display", display)

  toggle_password: (event) ->
    input_type = $("#password").attr("type") #get password input type

    #set input type based on initial type
    if input_type == "password"
      @change_password_attr "text"
    else
      @change_password_attr "password"

  change_password_attr: (type) ->
    $("#password").attr("type", type)
