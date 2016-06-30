class Hacista.Models.User extends Backbone.Model
  paramRoot: 'users'

  #defaults:

class Hacista.Collections.UsersCollection extends Backbone.Collection
  model: Hacista.Models.User
  url: '/api/users'
