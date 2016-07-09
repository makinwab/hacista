Hacista.Views.Users ||= {}

class Hacista.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initalize: ->
   #@collection.on("reset", @redirect_to_dashboard, this)
   #@collection.on("add", @redirect_to_dashboard, this)
   console.log "IndexView"

  events:
    "submit #new_user": "createUser"
    "click .new": "createUser"
    "click a.login": "signin"

  render: ->
    $(@el).html(@template(entries: "Entries here"))
    this

  createUser: (event) ->
    event.preventDefault()
    form_fields = $("#new_user :input")
    data = {}

    _.each form_fields, (field) ->
      if !_.isEmpty field.name
        data[field.name] = field.value

    @model.save(data, { wait: true, success: @redirect_to_dashboard })


  redirect_to_dashboard: (model) ->
    $("#new_user")[0].reset()
    window.location = "/dashboard"

  signin: (event) ->
    event.preventDefault()
    window.location = "#auth"
