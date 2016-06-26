class Hacista.Models.User extends Backbone.Model
  paramRoot: 'user'

  #defaults:

class Hacista.Collections.UsersCollection extends Backbone.Collection
  model: Hacista.Models.User
  url: '/users'
