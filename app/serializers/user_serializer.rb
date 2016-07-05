class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :username

  include Obfuscate

  def id
    encrypt object.id
  end
end
