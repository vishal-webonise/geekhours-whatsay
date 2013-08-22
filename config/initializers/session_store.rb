# Be sure to restart your server when you modify this file.

#Whatsay::Application.config.session_store :cookie_store, key: '_whatsay_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
Whatsay::Application.config.session_store :mongoid_store, key: '_session_id', collection: lambda { Mongoid.default_session[:sessions] }

# Rails.application.config.middleware.insert_before(
#   ActionDispatch::Session::MongoidStore,
#   FlashSessionCookieMiddleware,
#   Rails.application.config.session_options[:key]
# )
