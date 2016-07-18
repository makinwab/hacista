Hacista.Views.Users ||= {}

class Hacista.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initalize: ->
   console.log "IndexView"

  events:
    "submit #new_user": "create_user"
    "click .new": "create_user"
    "click a.login": "sign_in"

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

    @model.save(data, { wait: true, success: @redirect_to_dashboard })
    @show_loader "none" #hide progress bar

  redirect_to_dashboard: (model) ->
    $("#new_user")[0].reset() #reset form
    window.location = "/dashboard" #redirect user to dashboard

  sign_in: (event) ->
    event.preventDefault()
    window.location = "#auth"

  show_loader: (display) ->
    $("#p2").css("display", display)
