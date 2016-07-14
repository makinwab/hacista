require "openssl"
require "base64"

module Obfuscate
  def self.included(base)
    base.extend self
  end

  def cipher
    OpenSSL::Cipher::Cipher.new("aes-256-cbc")
  end

  def cipher_key
    ENV["cipher_key"]
  end

  def decrypt(value)
    data = cipher.decrypt
    data.key = Digest::SHA256.digest(cipher_key)
    data.update(Base64.decode64(value.to_s)) + data.final
  end

  def encrypt(value)
    data = cipher.encrypt
    data.key = Digest::SHA256.digest(cipher_key)
    Base64.encode64(data.update(value.to_s) + data.final)
  end
end
