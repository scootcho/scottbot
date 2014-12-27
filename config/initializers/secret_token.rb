# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

Scottbot::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
  "8d8d20230dbd5f7c46eb44232e180b8770d40aa9a6287caa52e57a72baf815779642536df42e59a4e507a18f623dcaa6cd1f2f6506ff7176797511302650408e"
else
  ENV['SECRET_TOKEN']
end
