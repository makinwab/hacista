Hacista.Views.Users ||= {}

class Hacista.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (user) =>
    view = new Hacista.Views.Users.UserView({model : user})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(users: @collection.toJSON() ))
    @addAll()

    return this
