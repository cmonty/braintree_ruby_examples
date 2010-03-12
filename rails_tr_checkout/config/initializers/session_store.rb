# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_checkout_session',
  :secret      => '7184cc3e682f8cb43219764cb30b889fa2f5c8156b5497c7c0d6ffbc110f5edf602254dabd6c2ccb572b3db2f7e55639bc01abcc3c8a659857904e2056eebab5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
