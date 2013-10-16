require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MissFacebook::Application.initialize!
