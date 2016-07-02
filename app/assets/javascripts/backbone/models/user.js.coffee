class Hacista.Models.User extends Backbone.Model
  paramRoot: 'users'
  urlRoot: '/api/users'

  #defaults:

class Hacista.Collections.UsersCollection extends Backbone.Collection
  model: Hacista.Models.User
  url: '/api/users'
