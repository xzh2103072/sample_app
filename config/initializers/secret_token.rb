# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks
require 'securerandom'
#SampleApp::Application.config.secret_token = '7c8189269b2dffe19f0dca2caba9acae30de291b46aedbf2a5a321039e752c5ffd435f61de2d071c202cff3fb7edacebf9952339f1937f5a8d7be364f002f291'
def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
       File.read(token_file).chomp
    else
      token = SecureRandom.hex(64)
      File.write(token_file,token)
      token
    end
end
SampleApp::Application.config.secret_key_base = secure_token
