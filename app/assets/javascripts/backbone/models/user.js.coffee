class Hacista.Models.User extends Backbone.Model
  url: (path = "") ->
    return '/api/users' + "/" + path

  paramRoot: 'users'

  #defaults:

class Hacista.Collections.UsersCollection extends Backbone.Collection
  model: Hacista.Models.User
  url: (path = "") ->
    '/api/users' + "/" + path
