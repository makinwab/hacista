class Hacista.Models.User extends Backbone.Model
  url: (path = "") ->
    return '/api/user' + "/" + path

  paramRoot: 'users'


class Hacista.Collections.UsersCollection extends Backbone.Collection
  model: Hacista.Models.User
  url: (path = "") ->
    '/api/users' + "/" + path
