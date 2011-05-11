RAILS_GEM_VERSION = '2.3.11' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_rails_session',
    :secret      => 'e2f5641ab4a3627096a2b6ca8c62cefe53f572906ad6a5fb1c949d183a0'
  }
  config.frameworks -= [:active_record]
end


# Basic CAS client configuration

require 'casclient'
require 'casclient/frameworks/rails/filter'

CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://secure.its.yale.edu/cas"
)

require 'active_ldap'

ActiveLdap::Base.setup_connection :host => 'directory.yale.edu', :base => 'o=yale.edu'